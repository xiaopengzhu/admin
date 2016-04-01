<?php

namespace App\Services\Admin\School\Validate;

use Validator, Lang;
use App\Models\Admin\School as SchoolModel;
use App\Services\BaseValidate;

/**
 * 学校表单验证
 *
 */
class School extends BaseValidate
{
    /**
     * 增加
     *
     * @access public
     */
    public function add(\App\Services\Admin\School\Param\SchoolSave $data)
    {
        // 创建验证规则
        $rules = array(
            'name' => 'required',
            'status' => 'required|numeric',
        );
        
        // 自定义验证消息
        $messages = array(
            'name.required' => Lang::get('school.school_name_empty'),
            'status.required' => Lang::get('school.school_status_empty'),
        );
        
        // 开始验证
        $validator = Validator::make($data->toArray(), $rules, $messages);
        if($validator->fails())
        {
            $this->errorMsg = $validator->messages()->first();
            return false;
        }

        //判断学校是否已经存在
        $check = SchoolModel::where('name', $data->name)->first();
        if ($check) {
            $this->errorMsg = Lang::get('school.school_exist');
            return false;
        }

        //验证学校名在易班基础库中是否存在
        $school = YbBaseApi('School', 'searchSchool', ['where' => ['name'=>$data->name]]);
        if ($school['status'] == 1 && count($school['data']['list']) > 0 && ($id = $school['data']['list'][0]['id'])) {
            $data->setId($id);
        } else {
            $this->errorMsg = Lang::get('school.school_not_exist_in_yiban');
            return false;
        }

        return true;
    }
    
    /**
     * 编辑用户组的时候的表单验证
     *
     * @access public
     */
    public function edit(\App\Services\Admin\School\Param\SchoolSave $data)
    {
        return $this->add($data);
    }

}
