<?php

namespace App\Models\Admin;

use App\Services\Admin\SC;

/**
 * 报表模型
 *
 */
class Report extends Base
{
    /**
     * 表名
     *
     * @var string
     */
    protected $table = 'report';

    /**
     * 可以被集体附值的表的字段
     *
     * @var string
     */
    protected $fillable = array('id', 'hotspot_id', 'agency_id', 'type', 'ybuser_id', 'ybuser_name', 'login_time', 'status', 'desc');

    /**
     * 与agency表关联
     */
    public function agency()
    {
        return $this->belongsTo('App\Models\Admin\Agency');
    }

    /**
     * 与hotspot表关联
     */
    public function hotspot()
    {
        return $this->belongsTo('App\Models\Admin\Hotspot');
    }
    
    /**
     * 取得所有
     *
     * @return array
     */
    public function getAllByPage($data)
    {
        $currentQuery = $this->orderBy('id', 'desc');
        if(is_array($data['agency_id']) and count($data['agency_id'])>0) $currentQuery->whereIn('agency_id', $data['agency_id']);
        if(isset($data['hotspot_id']) and ! empty($data['hotspot_id'])) $currentQuery->where('hotspot_id', $data['hotspot_id']);
        if(isset($data['timeFrom'], $data['timeTo']) and ! empty($data['timeFrom']) and ! empty($data['timeTo']))
        {
            $data['timeFrom'] = strtotime($data['timeFrom']);
            $data['timeTo'] = strtotime($data['timeTo']);
            $currentQuery->whereBetween('login_time', [$data['timeFrom'], $data['timeTo']]);
        }
        $result = $currentQuery->paginate(self::PAGE_NUMS);
        return $result;
    }

    /**
     * 取得所有
     *
     * @return array
     */
    public function getAll()
    {
        return $this->all();
    }

    /**
     * 饼图数据
     * 显示查询条件的人数和总人的的占比
     * @return string
     */
    public function getPieData($data)
    {
        $total = $this->count();

        $currentQuery = $this->orderBy('id', 'desc');
        if(is_array($data['agency_id']) and count($data['agency_id'])>0) $currentQuery->whereIn('agency_id', $data['agency_id']);
        if(isset($data['hotspot_id']) and ! empty($data['hotspot_id'])) $currentQuery->where('hotspot_id', $data['hotspot_id']);
        if(isset($data['timeFrom'], $data['timeTo']) and ! empty($data['timeFrom']) and ! empty($data['timeTo']))
        {
            $data['timeFrom'] = strtotime($data['timeFrom']);
            $data['timeTo'] = strtotime($data['timeTo']);
            $currentQuery->whereBetween('login_time', [$data['timeFrom'], $data['timeTo']]);
        }

        $num = $currentQuery->count();

        $data = [
            ['value' => $num, 'color' => '#F7464A', 'highlight' => '#FF5A5E', 'label' => '统计人数'],
            ['value' => $total, 'color' => '#46BFBD', 'highlight' => '#5AD3D1', 'label' => '总人数']
        ];

        return  json_encode($data);
    }

    /**
     * 线性图表的数据
     * 显示每小时的访问数
     * @param $data
     * @return string
     */
    public function getLineData($data)
    {
        $currentQuery = $this->orderBy('id', 'desc');
        if(is_array($data['agency_id']) and count($data['agency_id'])>0) $currentQuery->whereIn('agency_id', $data['agency_id']);
        if(isset($data['hotspot_id']) and ! empty($data['hotspot_id'])) $currentQuery->where('hotspot_id', $data['hotspot_id']);
        if(isset($data['timeFrom'], $data['timeTo']) and ! empty($data['timeFrom']) and ! empty($data['timeTo']))
        {
            $data['timeFrom'] = strtotime($data['timeFrom']);
            $data['timeTo'] = strtotime($data['timeTo']);
            $currentQuery->whereBetween('login_time', [$data['timeFrom'], $data['timeTo']]);
        }

        //数据归类处理
        $list = $currentQuery->get()->toArray();
        $ary = [];
        for($i = 0; $i<24; $i++) {
            $ary[$i.':00'] = 0;
            foreach ($list as $key => $value) {
                if ($i == date('H', $value['login_time'])) {
                    $ary[$i.':00'] += 1;
                }
            }
        }

        $data = [
            'labels' => array_keys($ary), //x轴坐标
            'datasets' => [
                [
                'fillColor' => "transparent", // 背景色
                'strokeColor' => "#ef7c1f", // 线
                'pointColor' => "#ef7c1f", // 点
                'pointStrokeColor' => "#fff", // 点的包围圈
                'data' => array_values($ary) // Y轴坐标
                ]
            ]
        ];

        return json_encode($data);
    }

    /**
     * 获取报表可用机构热点信息
     */
    public function getAgencyData()
    {
        $user = SC::getLoginSession();
        $schools = [];

        if ($agency_id = $user->agency_id) {//用户有归属机构
            //获取归属机构类型
            $agency = Agency::find($agency_id)->toArray();
            if ($agency) {
                if ($agency['type'] == Agency::TYPE_ST) {//省厅
                    //获取下属学校ID
                    $schools = with(new Agency())->where('pid', $agency_id)
                                ->where('status', Agency::ON)
                                ->where('type', Agency::TYPE_SCHOOL)
                                ->get()
                                ->toArray();
                } elseif($agency['type'] == Agency::TYPE_SCHOOL) {//学校
                    $schools[] = $agency;
                }
            }
        } else {//用户无归属机构
            $schools = with(new Agency())->where('status', Agency::ON)
                        ->where('type', Agency::TYPE_SCHOOL)
                        ->get()
                        ->toArray();
        }

        //拉取学校下的热点
        foreach($schools as $k => $v) {
            $schools[$k]['hotspots'] = with(new Hotspot())->where('agency_id', $v['id'])
                                        ->where('status', Hotspot::ON)
                                        ->get()->toArray();
        }

        return $schools;
    }

}
