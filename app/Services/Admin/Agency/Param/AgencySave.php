<?php

namespace App\Services\Admin\Agency\Param;

use App\Services\AbstractParam;

/**
 * 机构有关的参数容器
 *
 */
class AgencySave extends AbstractParam
{
    protected $name;

    protected $status;

    protected $pid;

    protected $id;

    protected $type;

    protected $yb_id;

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

    public function setType($type)
    {
        $this->type = $this->attributes['type'] = $type;
        return $this;
    }

    public function setPid($pid)
    {
        $this->pid = $this->attributes['pid'] = $pid;
        return $this;
    }

    public function setYbId($yb_id)
    {
        $this->yb_id = $this->attributes['yb_id'] = $yb_id;
        return $this;
    }
}
