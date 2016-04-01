<?php

namespace App\Services\Admin\Hotspot\Param;

use App\Services\AbstractParam;

/**
 * 学校有关的参数容器
 *
 */
class HotspotSave extends AbstractParam
{
    protected $name;

    protected $status;

    protected $school_id;

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

    public function setSchoolId($school_id)
    {
        $this->school_id = $this->attributes['school_id'] = $school_id;
        return $this;
    }

}
