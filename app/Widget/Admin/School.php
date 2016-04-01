<?php

namespace App\Widget\Admin;

/**
 * 学校列表小组件
 *
 */
class School extends AbstractBase
{
    /**
     * 编辑操作
     *
     * @access public
     */
    public function edit($data)
    {
        $this->setCurrentAction('school', 'edit', 'foundation')->checkPermission();
        $url = R('common', $this->module.'.'.$this->class.'.'.$this->function, ['id' => url_param_encode($data['id'])]);
        $html = $this->hasPermission ?
            '<a href="'.$url.'"><i class="fa fa-pencil"></i></a>'
            : '<i class="fa fa-pencil" style="color:#ccc"></i>';
        return $html;
    }

    /**
     * 添加学校热点
     */
    public function addHotspot($data)
    {
        $this->setCurrentAction('hotspot', 'add', 'foundation')->checkPermission();
        $url = R('common', $this->module.'.'.$this->class.'.'.$this->function, ['id' => url_param_encode($data['id'])]);
        $html = $this->hasPermission ?
            '<a href="'.$url.'"><i class="fa fa-plus-square"></i></a>'
            : '<i class="fa fa-pencil" style="color:#ccc"></i>';
        return $html;
    }

    /**
     * 删除操作
     *
     * @access public
     */
    public function delete($data)
    {
        $this->setCurrentAction('school', 'delete', 'foundation')->checkPermission();
        $url = R('common', $this->module.'.'.$this->class.'.'.$this->function, ['id' => url_param_encode($data['id'])]);
        $html = $this->hasPermission ?
            '<a href="javascript:org.Common.ajaxDelete(\''.$url.'\', \'sys-list\', \'确定吗？\');"><i class="fa fa-trash-o"></i></a>'
            : '<i class="fa fa-trash-o" style="color:#ccc"></i>';
        return $html;
    }

    /**
     * 面包屑中的按钮
     *
     * @access public
     */
    public function navBtn()
    {
        $this->setCurrentAction('school', 'add', 'foundation')->checkPermission();
        $url = R('common', $this->module.'.'.$this->class.'.'.$this->function);
        $html = $this->hasPermission ?
            '<div class="btn-group" style="float:right;"><a href="'.$url.'" title="增加学校" class="btn btn-primary btn-xs"><span aria-hidden="true" class="glyphicon glyphicon-plus"></span>增加学校</a></div>'
            : '';
        return $html;
    }

}