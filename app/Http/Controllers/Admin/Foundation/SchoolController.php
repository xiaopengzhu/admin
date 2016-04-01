<?php

namespace App\Http\Controllers\Admin\Foundation;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\School as SchoolModel;
use Request, Lang, Session;
use App\Services\Admin\School\Process as SchoolProcess;
use App\Services\Admin\School\Param\SchoolSave;
use App\Libraries\Js;

/**
 * 学校管理
 *
 */
class SchoolController extends Controller
{
    /**
     * 列表
     *
     * @access public
     */
    public function index()
    {
        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $schoollist = with(new SchoolModel())->getAllByPage();
        $page = $schoollist->setPath('')->appends(Request::all())->render();
        return view('admin.school.index', compact('schoollist', 'page'));
    }
    
    /**
     * 增加
     *
     * @access public
     */
    public function add()
    {
        if(Request::method() == 'POST') return $this->saveDatasToDatabase();
        $formUrl = R('common', 'foundation.school.add');
        return view('admin.school.add', compact('formUrl'));
    }
    
    /**
     * 增加入库
     *
     * @access private
     */
    private function saveDatasToDatabase()
    {
        $data = (array) Request::input('data');
        $params = new SchoolSave();
        $params->setAttributes($data);

        $manager = new SchoolProcess();
        if($manager->add($params) !== false) {
            $this->setActionLog();
            return Js::locate(R('common', 'foundation.school.index'), 'parent');
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
        $schoolInfos = with(new SchoolModel())->getInIds($id);

        $manager = new SchoolProcess();
        if($manager->del($id)) {
            $this->setActionLog(['schoolInfos' => $schoolInfos]);
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
        $schoolId = url_param_decode($id);

        if( ! $schoolId or ! is_numeric($schoolId)) {
            return Js::error(Lang::get('common.illegal_operation'));
        }

        $schoolInfo = with(new SchoolModel())->getById($schoolId);
        if(empty($schoolInfo)) return Js::error(Lang::get('school.school_not_found'));

        $formUrl = R('common', 'foundation.school.edit');

        return view('admin.school.add', compact('schoolInfo', 'formUrl', 'id'));
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

        $params = new SchoolSave();
        $params->setAttributes($data);

        $manager = new SchoolProcess();
        if($manager->edit($params)) {
            $this->setActionLog();
            $backUrl = ( ! empty($httpReferer)) ? $httpReferer : R('common', 'foundation.school.index');
            return Js::locate($backUrl, 'parent');
        }
        return Js::error($manager->getErrorMessage());
    }

}