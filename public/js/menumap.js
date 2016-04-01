/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports) {

	"use strict";
	
	var __ztreeSetting = {
	    data: {
	        simpleData: {
	            enable: true
	        }
	    }
	};
	
	var __zNodes = cacheData.zNodes;
	
	var __artdialogZtree = {
	    menMap: $(".menu-map"),
	    d: {
	        width: 390,
	        height: 390,
	        title: "功能地图"
	    },
	    content: "<div id=\"men-map\" class=\"ztree\" style=\"width:390px;height:390px;overflow: auto; padding-left:10px; padding-top:10px;\"></div>",
	    init: function init() {
	        var _this = __artdialogZtree;
	        _this.menMap.click(_this.dialog);
	    },
	    dialog: (function (_dialog) {
	        var _dialogWrapper = function dialog() {
	            return _dialog.apply(this, arguments);
	        };
	
	        _dialogWrapper.toString = function () {
	            return _dialog.toString();
	        };
	
	        return _dialogWrapper;
	    })(function () {
	        var _this = __artdialogZtree;
	        var _d = dialog({
	            title: _this.d.title,
	            id: _this.menMap.attr("data-dialog-id"),
	            fixed: true,
	            content: _this.content,
	            width: _this.d.width,
	            height: _this.d.height,
	            padding: 0,
	            onshow: function onshow() {
	                $.fn.zTree.init($("#men-map"), __ztreeSetting, __zNodes);
	            }
	        });
	        _d.showModal();
	    })
	};
	
	$(function () {
	    __artdialogZtree.init();
	    $(document).keydown(function (e) {
	        // ctrl + q
	        if (e.ctrlKey == true && e.keyCode == 81) {
	            __artdialogZtree.menMap.trigger("click");
	            return false;
	        }
	    });
	});

/***/ }
/******/ ]);
//# sourceMappingURL=menumap.js.map