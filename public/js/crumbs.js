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
	
	var __mpass = {
	    postUrl: cacheData.postUrl,
	    mpobj: $(".modify-password"),
	    mpcontent: $(".modify-password-content"),
	    dialogConf: {
	        width: 390,
	        height: 230,
	        title: "修改密码",
	        okValue: "确定",
	        cancelValue: "取消",
	        doingValue: "提交中…"
	    },
	    init: function init() {
	        var _this = __mpass;
	        _this.mpobj.click(_this.dialog);
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
	        var _this = __mpass;
	        var _d = dialog({
	            title: _this.dialogConf.title,
	            id: _this.mpobj.attr("data-dialog-id"),
	            fixed: true,
	            content: _this.mpcontent.html(),
	            width: _this.dialogConf.width,
	            height: _this.dialogConf.height,
	            okValue: _this.dialogConf.okValue,
	            ok: function ok() {
	                return _this.okCallback(this);
	            },
	            cancelValue: _this.dialogConf.cancelValue,
	            cancel: function cancel() {}
	        });
	        _d.showModal();
	    }),
	    okCallback: function okCallback(dialogObj) {
	        var _this = __mpass;
	        dialogObj.title(_this.dialogConf.doingValue);
	        var old_password = $("input[name=\"old_password\"]:visible").val();
	        var new_password = $("input[name=\"new_password\"]:visible").val();
	        var new_password_repeat = $("input[name=\"new_password_repeat\"]:visible").val();
	        $.post(_this.postUrl, { old_password: old_password, new_password: new_password, new_password_repeat: new_password_repeat }, function (data) {
	            org.Common.alert(data.message);
	            dialogObj.title(_this.dialogConf.title);
	            if (data.result == "success") {
	                dialogObj.close().remove();
	                window.location.href = "/";
	            }
	        });
	        return false;
	    }
	};
	
	$(document).ready(function () {
	    __mpass.init();
	});

/***/ }
/******/ ]);
//# sourceMappingURL=crumbs.js.map