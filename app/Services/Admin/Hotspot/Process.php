<?php

namespace App\Services\Admin\Hotspot;

use Lang;
use App\Models\Admin\Hotspot as HotspotModel;
use App\Services\Admin\Hotspot\Validate\Hotspot as HotspotValidate;
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
    private $hotspotModel;

    /**
     * 学校表单验证对象
     * 
     * @var object
     */
    private $hotspotValidate;

    /**
     * 初始化
     *
     * @access public
     */
    public function __construct()
    {
        if( ! $this->hotspotModel) $this->hotspotModel = new HotspotModel();
        if( ! $this->hotspotValidate) $this->hotspotValidate = new HotspotValidate();
    }

    /**
     * 增加
     *
     * @param mixed $data
     * @return boolean true|false
     * @access public
     */
    public function add(\App\Services\Admin\Hotspot\Param\HotspotSave $data)
    {
        if( ! $this->hotspotValidate->add($data)) return $this->setErrorMsg($this->hotspotValidate->getErrorMessage());
        if($this->hotspotModel->add($data->toArray()) !== false) return true;
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

        if($this->hotspotModel->del($ids) !== false) {
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
    public function edit(\App\Services\Admin\Hotspot\Param\HotspotSave $data)
    {
        if( ! isset($data->id)) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        $id = intval(url_param_decode($data->id)); unset($data->id);
        if( ! $id) return $this->setErrorMsg(Lang::get('common.illegal_operation'));

        if( ! $this->hotspotValidate->edit($data)) {
            return $this->setErrorMsg($this->hotspotValidate->getErrorMessage());
        }

        if($this->hotspotModel->edit($data->toArray(), $id) === false) {
            return $this->setErrorMsg(Lang::get('common.action_error'));
        }

        return true;
    }

}