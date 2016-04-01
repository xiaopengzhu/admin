<?php

namespace App\Models\Admin;

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
    protected $fillable = array('id', 'hotspot_id', 'school_id', 'type', 'ybuser_id', 'ybuser_name', 'login_time', 'status', 'desc');

    /**
     * 与school表关联
     */
    public function school()
    {
        return $this->belongsTo('App\Models\Admin\School');
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
        if(isset($data['school_id']) and ! empty($data['school_id'])) $currentQuery->where('school_id', $data['school_id']);
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
        if(isset($data['school_id']) and ! empty($data['school_id'])) $currentQuery->where('school_id', $data['school_id']);
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
        if(isset($data['school_id']) and ! empty($data['school_id'])) $currentQuery->where('school_id', $data['school_id']);
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

}
