<?php

namespace App\Http\Controllers\Admin\Foundation;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\Report as ReportModel;
use App\Models\Admin\Agency as AgencyModel;
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
        $agencyList = with(new ReportModel())->getAgencyData();

        $agency_id = strip_tags(Request::input('agency_id'));
        $data['hotspot_id'] = strip_tags(Request::input('hotspot_id'));
        $data['timeFrom'] = strip_tags(Request::input('time_from'));
        $data['timeTo'] = strip_tags(Request::input('time_to'));

        //取全部处理
        $agency_ids = [];
        if (!$agency_id) {
            foreach($agencyList as $v) {
                $agency_ids[] = $v['id'];
            }
        } else {
            $agency_ids = [$agency_id];
        }
        $data['agency_id'] = $agency_ids;

        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $list = with(new ReportModel())->getAllByPage($data);
        $page = $list->setPath('')->appends(Request::all())->render();

        //图表数据
        $pieData = with(new ReportModel())->getPieData($data);
        $lineData = with(new ReportModel())->getLineData($data);

        //数据还原
        $agencyData = json_encode($agencyList);
        $data['agency_id'] = $agency_id;
        return view('admin.report.index', compact('list', 'page', 'data', 'agencyData', 'pieData', 'lineData'));
    }

}