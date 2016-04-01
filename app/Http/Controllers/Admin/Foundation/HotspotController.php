<?php

namespace App\Http\Controllers\Admin\Foundation;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\Hotspot as HotspotModel;
use App\Models\Admin\School as SchoolModel;
use Request, Lang, Session;
use App\Services\Admin\Hotspot\Process as HotspotProcess;
use App\Services\Admin\Hotspot\Param\HotspotSave;
use App\Libraries\Js;

/**
 * 热点管理
 *
 */
class HotspotController extends Controller
{
    /**
     * 列表
     *
     * @access public
     */
    public function index()
    {
        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $hotspotlist = with(new HotspotModel())->getAllByPage();
        $page = $hotspotlist->setPath('')->appends(Request::all())->render();
        return view('admin.hotspot.index', compact('hotspotlist', 'page'));
    }
    
    /**
     * 增加
     *
     * @access public
     */
    public function add()
    {
        if(Request::method() == 'POST') return $this->saveDatasToDatabase();

        $school_id = Request::input('id');
        if( ! ($school_id = (int)url_param_decode($school_id)) ) {
            return responseJson(Lang::get('common.action_error'));
        }

        $school = SchoolModel::find($school_id);
        if (!$school) {
            return responseJson(Lang::get('school.school_not_found'));
        }
        $school_name = $school->name;

        $formUrl = R('common', 'foundation.hotspot.add');
        return view('admin.hotspot.add', compact('formUrl', 'school_id', 'school_name'));
    }
    
    /**
     * 增加入库
     *
     * @access private
     */
    private function saveDatasToDatabase()
    {
        $data = (array) Request::input('data');
        $params = new HotspotSave();
        $params->setAttributes($data);

        $manager = new HotspotProcess();
        if($manager->add($params) !== false) {
            $this->setActionLog();
            return Js::locate(R('common', 'foundation.hotspot.index'), 'parent');
        }

        return Js::error($manager->getErrorMessage());
    }

    /**
     * 删除
     *
     * @access public
     */
    public function delete()
    {
        $id = (array) Request::input('id');

        foreach($id as $key => $value) {
            if( ! ($id[$key] = url_param_decode($value)) ) {
                return responseJson(Lang::get('common.action_error'));
            }
        }

        $id = array_map('intval', $id);
        $hotspotInfos = with(new HotspotModel())->getInIds($id);

        $manager = new HotspotProcess();
        if($manager->del($id)) {
            $this->setActionLog(['hotspotInfos' => $hotspotInfos]);
            return responseJson(Lang::get('common.action_success'), true);
        }

        return responseJson($manager->getErrorMessage());
    }
    
    /**
     * 编辑
     *
     * @access public
     */
    public function edit()
    {
        if(Request::method() == 'POST') {
            return $this->updateDatasToDatabase();
        }

        Session::flashInput(['http_referer' => Session::getOldInput('http_referer')]);
        $id = Request::input('id');
        $hotspotId = url_param_decode($id);

        if( ! $hotspotId or ! is_numeric($hotspotId)) {
            return Js::error(Lang::get('common.illegal_operation'));
        }

        $hotspotInfo = with(new HotspotModel())->getById($hotspotId);
        if(empty($hotspotInfo)) return Js::error(Lang::get('hotspot.hotspot_not_found'));

        $school_id = $hotspotInfo->school_id;
        $school = SchoolModel::find($school_id);
        if(!$school) return Js::error(Lang::get('school.school_not_found'));
        $school_name = $school->name;

        $formUrl = R('common', 'foundation.hotspot.edit');

        return view('admin.hotspot.add', compact('hotspotInfo', 'formUrl', 'id', 'school_name'));
    }
    
    /**
     * 编辑入库
     *
     * @access private
     */
    private function updateDatasToDatabase()
    {
        $httpReferer = Session::getOldInput('http_referer');
        $data = (array) Request::input('data');

        $params = new HotspotSave();
        $params->setAttributes($data);

        $manager = new HotspotProcess();
        if($manager->edit($params)) {
            $this->setActionLog();
            $backUrl = ( ! empty($httpReferer)) ? $httpReferer : R('common', 'foundation.hotspot.index');
            return Js::locate($backUrl, 'parent');
        }
        return Js::error($manager->getErrorMessage());
    }

}