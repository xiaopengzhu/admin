<?php

namespace App\Services\Admin\School;

use Lang;
use App\Models\Admin\School as SchoolModel;
use App\Services\Admin\School\Validate\School as SchoolValidate;
use App\Services\BaseProcess;

/**
 * 学校
 *
 */
class Process extends BaseProcess
{
    /**
     * 学校模型
     * 
     * @var object
     */
    private $schoolModel;

    /**
     * 学校表单验证对象
     * 
     * @var object
     */
    private $schoolValidate;

    /**
     * 初始化
     *
     * @access public
     */
    public function __construct()
    {
        if( ! $this->schoolModel) $this->schoolModel = new SchoolModel();
        if( ! $this->schoolValidate) $this->schoolValidate = new SchoolValidate();
    }

    /**
     * 增加
     *
     * @param mixed $data
     * @return boolean true|false
     * @access public
     */
    public function add(\App\Services\Admin\School\Param\SchoolSave $data)
    {
        if( ! $this->schoolValidate->add($data)) return $this->setErrorMsg($this->schoolValidate->getErrorMessage());
        if($this->schoolModel->add($data->toArray()) !== false) return true;
        return $this->setErrorMsg(Lang::get('common.action_error'));
    }

    /**
     * 删除
     * 
     * @param array $ids
     * @return boolean true|false
     * @access public
     */
    public function del($ids)
    {
        if( ! is_array($ids)) return false;

        if($this->schoolModel->del($ids) !== false) {
            return true;
        }
        return $this->setErrorMsg(Lang::get('common.action_error'));
    }

    /**
     * 编辑
     *
     * @param mixed $data
     * @return boolean true|false
     * @access public
     */
    public function edit(\App\Services\Admin\School\Param\SchoolSave $data)
    {
        if( ! isset($data->id)) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        $id = intval(url_param_decode($data->id)); unset($data->id);
        if( ! $id) return $this->setErrorMsg(Lang::get('common.illegal_operation'));

        if( ! $this->schoolValidate->edit($data)) {
            return $this->setErrorMsg($this->schoolValidate->getErrorMessage());
        }

        if($this->schoolModel->edit($data->toArray(), $id) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

}