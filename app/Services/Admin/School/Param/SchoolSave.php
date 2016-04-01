<?php

namespace App\Services\Admin\School\Param;

use App\Services\AbstractParam;

/**
 * 学校有关的参数容器
 *
 */
class SchoolSave extends AbstractParam
{
    protected $name;

    protected $status;

    protected $id;

    public function setName($name)
    {
        $this->name = $this->attributes['name'] = $name;
        return $this;
    }

    public function setStatus($status)
    {
        $this->status = $this->attributes['status'] = $status;
        return $this;
    }

    public function setId($id)
    {
        $this->id = $this->attributes['id'] = $id;
        return $this;
    }

}
