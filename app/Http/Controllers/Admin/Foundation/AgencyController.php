<?php

namespace App\Http\Controllers\Admin\Foundation;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\Agency as AgencyModel;
use Request, Lang, Session;
use App\Services\Admin\Agency\Process as AgencyProcess;
use App\Services\Admin\Agency\Param\AgencySave;
use App\Libraries\Js;

/**
 * 机构管理
 *
 */
class AgencyController extends Controller
{
    /**
     * 列表
     *
     * @access public
     */
    public function index()
    {
        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $agencylist = with(new AgencyModel())->getAllByPage();
        $page = $agencylist->setPath('')->appends(Request::all())->render();
        return view('admin.agency.index', compact('agencylist', 'page'));
    }
    
    /**
     * 增加
     *
     * @access public
     */
    public function add()
    {
        if(Request::method() == 'POST') return $this->saveDatasToDatabase();

        $st_list = with(new AgencyModel())->getStList();
        $formUrl = R('common', 'foundation.agency.add');
        return view('admin.agency.add', compact('formUrl', 'st_list'));
    }
    
    /**
     * 增加入库
     *
     * @access private
     */
    private function saveDatasToDatabase()
    {
        $data = (array) Request::input('data');
        $params = new AgencySave();
        $params->setAttributes($data);

        $manager = new AgencyProcess();
        if($manager->add($params) !== false) {
            $this->setActionLog();
            return Js::locate(R('common', 'foundation.agency.index'), 'parent');
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
        $agencyInfos = with(new AgencyModel())->getInIds($id);

        $manager = new AgencyProcess();
        if($manager->del($id)) {
            $this->setActionLog(['agencyInfos' => $agencyInfos]);
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
        $agencyId = url_param_decode($id);

        if( ! $agencyId or ! is_numeric($agencyId)) {
            return Js::error(Lang::get('common.illegal_operation'));
        }

        $agencyInfo = with(new AgencyModel())->getById($agencyId);
        if(empty($agencyInfo)) return Js::error(Lang::get('agency.agency_not_found'));

        $st_list = with(new AgencyModel())->getStList();

        $formUrl = R('common', 'foundation.agency.edit');

        return view('admin.agency.add', compact('agencyInfo', 'formUrl', 'id', 'st_list'));
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

        $params = new AgencySave();
        $params->setAttributes($data);

        $manager = new AgencyProcess();
        if($manager->edit($params)) {
            $this->setActionLog();
            $backUrl = ( ! empty($httpReferer)) ? $httpReferer : R('common', 'foundation.agency.index');
            return Js::locate($backUrl, 'parent');
        }
        return Js::error($manager->getErrorMessage());
    }

}