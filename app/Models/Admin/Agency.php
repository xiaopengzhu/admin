<?php

namespace App\Models\Admin;

/**
 * 机构模型
 *
 */
class Agency extends Base
{
    /**
     * 表名
     *
     * @var string
     */
    protected $table = 'agency';

    /**
     * 学校类型
     */
    const TYPE_SCHOOL = 1;

    /**
     * 省厅类型
     */
    const TYPE_ST = 2;

    /**
     * 启用状态
     */
    const ON = 1;

    /**
     * 停用状态
     */
    const OFF = 0;

    /**
     * 可以被集体附值的表的字段
     *
     * @var string
     */
    protected $fillable = array('id', 'type', 'name', 'status');


    /**
     * 自我关联
     */
    public function parent()
    {
        return $this->belongsTo('App\Models\Admin\Agency', 'pid', 'id');
    }
    
    /**
     * 取得所有
     *
     * @return array
     */
    public function getAllByPage()
    {
        $currentQuery = $this->orderBy('id', 'desc')->paginate(self::PAGE_NUMS);
        return $currentQuery;
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
     * 取得指定ID
     * 
     * @param int $id
     * @return array
     */
    public function getById($id)
    {
        return $this->where('id', '=', intval($id))->first();
    }

    /**
     * 增加
     * 
     * @param array $data 所需要插入的信息
     * @return static
     */
    public function add(array $data)
    {
        return $this->create($data);
    }
    
    /**
     * 修改
     * 
     * @param array $data 所需要插入的信息
     */
    public function edit(array $data, $id)
    {
        return $this->where('id', '=', intval($id))->update($data);
    }
    
    /**
     * 删除
     * 
     * @param array $ids
     * @return int
     */
    public function del(array $ids)
    {
        return $this->destroy($ids);
    }

    /**
     * 取得指定ID组
     * 
     * @param int $ids
     * @return array
     */
    public function getInIds($ids)
    {
        if( ! is_array($ids)) return false;
        return $this->whereIn('id', $ids)->get()->toArray();
    }

    /**
     * 获取省厅列表
     * @return array
     */
    public function getStList()
    {
        return $this->where('pid', 0)
                    ->where('type', 2)
                    ->where('status', self::ON)
                    ->get()->toArray();
    }

    /**
     * 获取可选机构列表
     */
    public function getAgencyList()
    {
        return $this->where('status', self::ON)->get()->toArray();
    }

}
