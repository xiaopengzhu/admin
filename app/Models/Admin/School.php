<?php

namespace App\Models\Admin;

/**
 * 学校表模型
 *
 */
class School extends Base
{
    /**
     * 表名
     *
     * @var string
     */
    protected $table = 'school';

    /**
     * 可以被集体附值的表的字段
     *
     * @var string
     */
    protected $fillable = array('id', 'name', 'status');
    
    /**
     * 取得所有的学校
     *
     * @return array
     */
    public function getAllByPage()
    {
        $currentQuery = $this->orderBy('id', 'desc')->paginate(self::PAGE_NUMS);
        return $currentQuery;
    }

    /**
     * 取得所有的学校
     *
     * @return array
     */
    public function getAll()
    {
        return $this->all();
    }

    /**
     * 取得指定ID学校信息
     * 
     * @param int $id
     * @return array
     */
    public function getById($id)
    {
        return $this->where('id', '=', intval($id))->first();
    }

    /**
     * 增加学校
     * 
     * @param array $data 所需要插入的信息
     * @return static
     */
    public function add(array $data)
    {
        return $this->create($data);
    }
    
    /**
     * 修改学校
     * 
     * @param array $data 所需要插入的信息
     */
    public function edit(array $data, $id)
    {
        return $this->where('id', '=', intval($id))->update($data);
    }
    
    /**
     * 删除学校
     * 
     * @param array $ids
     * @return int
     */
    public function del(array $ids)
    {
        return $this->destroy($ids);
    }

    /**
     * 取得指定ID组的学校信息
     * 
     * @param int $ids
     * @return array
     */
    public function getInIds($ids)
    {
        if( ! is_array($ids)) return false;
        return $this->whereIn('id', $ids)->get()->toArray();
    }

}
