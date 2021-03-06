<?php

namespace App\Services\Admin\Hotspot\Param;

use App\Services\AbstractParam;

/**
 * 热点相关的参数容器
 *
 */
class HotspotSave extends AbstractParam
{
    protected $name;

    protected $status;

    protected $agency_id;

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

    public function setAgencyId($agency_id)
    {
        $this->agency_id = $this->attributes['agency_id'] = $agency_id;
        return $this;
    }

}
