<?php

namespace App\Services\Admin\Agency;

use Lang;
use App\Models\Admin\Agency as AgencyModel;
use App\Services\Admin\Agency\Validate\Agency as AgencyValidate;
use App\Services\BaseProcess;

/**
 * 机构
 *
 */
class Process extends BaseProcess
{
    /**
     * 机构模型
     * 
     * @var object
     */
    private $agencyModel;

    /**
     * 机构表单验证对象
     * 
     * @var object
     */
    private $agencyValidate;

    /**
     * 初始化
     *
     * @access public
     */
    public function __construct()
    {
        if( ! $this->agencyModel) $this->agencyModel = new AgencyModel();
        if( ! $this->agencyValidate) $this->agencyValidate = new AgencyValidate();
    }

    /**
     * 增加
     *
     * @param mixed $data
     * @return boolean true|false
     * @access public
     */
    public function add(\App\Services\Admin\Agency\Param\AgencySave $data)
    {
        if( ! $this->agencyValidate->add($data)) return $this->setErrorMsg($this->agencyValidate->getErrorMessage());
        if($this->agencyModel->add($data->toArray()) !== false) return true;
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

        if($this->agencyModel->del($ids) !== false) {
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
    public function edit(\App\Services\Admin\Agency\Param\AgencySave $data)
    {
        if( ! isset($data->id)) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        $id = intval(url_param_decode($data->id));
        if( ! $id) return $this->setErrorMsg(Lang::get('common.illegal_operation'));

        if( ! $this->agencyValidate->edit($data)) {
            return $this->setErrorMsg($this->agencyValidate->getErrorMessage());
        }

        unset($data->id);

        if($this->agencyModel->edit($data->toArray(), $id) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

}