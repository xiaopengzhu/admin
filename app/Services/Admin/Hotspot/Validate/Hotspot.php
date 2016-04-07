<?php

namespace App\Services\Admin\Hotspot\Validate;

use Validator, Lang;
use App\Services\BaseValidate;

/**
 * 热点表单验证
 *
 */
class Hotspot extends BaseValidate
{
    /**
     * 增加
     *
     * @access public
     */
    public function add(\App\Services\Admin\Hotspot\Param\HotspotSave $data)
    {
        // 创建验证规则
        $rules = array(
            'name' => 'required',
            'status' => 'required|numeric',
            'agency_id' => 'required|numeric'
        );
        
        // 自定义验证消息
        $messages = array(
            'name.required' => Lang::get('hotspot.hotspot_name_empty'),
            'status.required' => Lang::get('hotspot.hotspot_status_empty'),
            'agency_id.required' => Lang::get('hotspot.hotspot_agency_id_empty'),
        );
        
        //开始验证
        $validator = Validator::make($data->toArray(), $rules, $messages);
        if($validator->fails())
        {
            $this->errorMsg = $validator->messages()->first();
            return false;
        }
        return true;
    }
    
    /**
     * 编辑用户组的时候的表单验证
     *
     * @access public
     */
    public function edit(\App\Services\Admin\Hotspot\Param\HotspotSave $data)
    {
        return $this->add($data);
    }
    
}
