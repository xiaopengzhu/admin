<?php

namespace App\Http\Controllers\Admin\Foundation;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\Report as ReportModel;
use App\Models\Admin\School as SchoolModel;
use App\Models\Admin\Hotspot as HotspotModel;
use Request, Lang, Session;

/**
 * 报表管理
 *
 */
class ReportController extends Controller
{
    /**
     * 列表
     *
     * @access public
     */
    public function index()
    {
        $data['school_id'] = strip_tags(Request::input('school_id'));
        $data['hotspot_id'] = strip_tags(Request::input('hotspot_id'));
        $data['timeFrom'] = strip_tags(Request::input('time_from'));
        $data['timeTo'] = strip_tags(Request::input('time_to'));

        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $list = with(new ReportModel())->getAllByPage($data);
        $page = $list->setPath('')->appends(Request::all())->render();

        $school_list = SchoolModel::all();
        $hotspot_list = HotspotModel::all();

        //图表数据
        $pieData = with(new ReportModel())->getPieData($data);
        $lineData = with(new ReportModel())->getLineData($data);

        return view('admin.report.index', compact('list', 'page', 'data', 'school_list', 'hotspot_list', 'pieData', 'lineData'));
    }

}