<?php

namespace App\Services\Admin\Agency\Validate;

use Validator, Lang;
use App\Models\Admin\Agency as AgencyModel;
use App\Services\BaseValidate;

/**
 * 机构表单验证
 *
 */
class Agency extends BaseValidate
{
    /**
     * 增加
     *
     * @access public
     */
    public function add(\App\Services\Admin\Agency\Param\AgencySave $data)
    {
        // 创建验证规则
        $rules = array(
            'name' => 'required',
            'type' => 'required|numeric',
            'status' => 'required|numeric',
        );
        
        // 自定义验证消息
        $messages = array(
            'name.required' => Lang::get('agency.agency_name_empty'),
            'status.required' => Lang::get('agency.agency_status_empty'),
        );
        
        // 开始验证
        $validator = Validator::make($data->toArray(), $rules, $messages);
        if($validator->fails())
        {
            $this->errorMsg = $validator->messages()->first();
            return false;
        }

        //判断机构是否已经存在
        if (!$data->id) {
            $check = AgencyModel::where('name', $data->name)->first();
            if ($check) {
                $this->errorMsg = Lang::get('agency.agency_exist');
                return false;
            }
        }

        //如果类型是学校则验证机构名在易班基础库中是否存在
        if ($data->type == AgencyModel::TYPE_SCHOOL) {
            $agency = YbBaseApi('School', 'searchSchool', ['where' => ['name' => $data->name]]);
            if ($agency['status'] == 1 && count($agency['data']['list']) > 0 && ($id = $agency['data']['list'][0]['id'])) {
                $data->setYbId($id);
            } else {
                $this->errorMsg = Lang::get('agency.agency_not_exist_in_yiban');
                return false;
            }
        }

        return true;
    }
    
    /**
     * 编辑用户组的时候的表单验证
     *
     * @access public
     */
    public function edit(\App\Services\Admin\Agency\Param\AgencySave $data)
    {
        return $this->add($data);
    }

}
