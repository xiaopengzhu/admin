let __ztreeSetting = {
    data: {
        simpleData: {
            enable: true
        }
    }
};

let __zNodes = cacheData.zNodes;

let __artdialogZtree = {
    menMap: $('.menu-map'),
    d: {
        width: 390,
        height: 390,
        title: '功能地图'
    },
    content: '<div id="men-map" class="ztree" style="width:390px;height:390px;overflow: auto; padding-left:10px; padding-top:10px;"></div>',
    init: function() {
        let _this = __artdialogZtree;
        _this.menMap.click(_this.dialog);
    },
    dialog: function() {
        let _this = __artdialogZtree;
        let _d = dialog({
            title: _this.d.title,
            id: _this.menMap.attr('data-dialog-id'),
            fixed: true,
            content: _this.content,
            width: _this.d.width,
            height: _this.d.height,
            padding: 0,
            onshow: function() {
                $.fn.zTree.init($("#men-map"), __ztreeSetting, __zNodes);
            }
        });
        _d.showModal();
    }
};

$(function() {
    __artdialogZtree.init();
    $(document).keydown(function(e) {
        // ctrl + q
        if( e.ctrlKey  == true && e.keyCode == 81 ){
            __artdialogZtree.menMap.trigger('click');
            return false;
        }
    });
});