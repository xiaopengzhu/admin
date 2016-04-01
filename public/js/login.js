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
/***/ function(module, exports, __webpack_require__) {

	"use strict";
	
	var _interopRequire = function (obj) { return obj && obj.__esModule ? obj["default"] : obj; };
	
	var login = _interopRequire(__webpack_require__(1));
	
	login.submit(); //侦听登录按钮的点击事件
	login.prelogin(); //取得一次性的密钥
	
	$(function () {
	    $(".login-form").keyup(function (event) {
	        if (event.keyCode == 13) {
	            $("#submit").trigger("click");
	        }
	    });
	});

/***/ },
/* 1 */
/***/ function(module, exports) {

	/** login */
	"use strict";
	
	var cache_publickey_str = "publickey";
	var loading_image = "<img width=\"18\" src=\"images/loading-icons/loading7.gif\">";
	var login_form_obj = $("#login-form");
	var msg_obj = $("#msg");
	var submit_obj = $("#submit");
	var loading_obj = $("#loading");
	
	var $_GET = (function () {
	    var url = window.document.location.href.toString();
	    var u = url.split("?");
	    if (typeof u[1] == "string") {
	        u = u[1].split("&");
	        var get = {};
	        for (var i in u) {
	            var j = u[i].split("=");
	            get[j[0]] = j[1];
	        }
	        return get;
	    } else {
	        return {};
	    }
	})();
	
	//登录
	function login(username, password) {
	    $.ajax({
	        type: "get",
	        url: "/login/proc",
	        data: { username: username, password: password },
	        dataType: "jsonp",
	        jsonp: "callback",
	        jsonpCallback: "callback",
	        headers: {
	            "X-XSRF-TOKEN": $("meta[name=\"csrf-token\"]").attr("content")
	        },
	        success: function success(data) {
	            if (!data.result) {
	                prelogin(true);
	            }
	            msg_obj.html(data.msg).show();
	            if (data.result && typeof data.jumpUrl != "undefined") {
	                window.location.href = data.jumpUrl;
	            } else if (data.result) {
	                window.location.href = "/";
	            }
	        },
	        beforeSend: function beforeSend() {
	            submit_obj.html(loading_image);
	        },
	        timeout: 30000,
	        complete: function complete(request, status) {
	            if (status == "timeout") {
	                msg_obj.html("登录超时，请重试！");
	            }
	            submit_obj.html("登陆");
	        }
	    });
	}
	
	//登录前处理
	function prelogin(is_show_loading) {
	    $.ajax({
	        type: "get",
	        url: "/login/prelogin",
	        data: "",
	        dataType: "jsonp",
	        jsonp: "callback",
	        jsonpCallback: "callback",
	        success: function success(data) {
	            $("input").attr("disabled", false);
	            //确保正确返回了数据才会显示登录框
	            if (!is_show_loading) {
	                msg_obj.hide();
	                loginForm(true);
	            }
	            submit_obj.data(cache_publickey_str, data.pKey);
	            $("meta[name=\"csrf-token\"]").attr("content", data.a);
	        },
	        beforeSend: function beforeSend() {
	            msg_obj.html("处理中...").show();
	            $("input").attr("disabled", true);
	            if (!is_show_loading) {
	                loginForm(false);
	            }
	        },
	        timeout: 10000,
	        complete: function complete(request, status) {
	            if (status == "timeout") {}
	        }
	    });
	}
	
	//登录框的显示与隐藏
	function loginForm(show_or_hide) {
	    if (!show_or_hide) {
	        login_form_obj.hide();
	        loading_obj.show();
	    } else {
	        login_form_obj.show();
	        loading_obj.hide();
	    }
	}
	
	//侦听登录的点击事件
	function submit() {
	    submit_obj.on("click", function () {
	        var username = $("#username").val();
	        var password = $("#password").val();
	        if (username == "") {
	            msg_obj.html("请输入用户名").show();
	            return false;
	        }
	        if (password == "") {
	            msg_obj.html("请输入密码").show();
	            return false;
	        }
	        password = CryptoJS.MD5(password);
	        var publickey = submit_obj.data(cache_publickey_str);
	        if (typeof publickey == "undefined") {
	            msg_obj.html("登录失败，非法操作。");
	            return false;
	        }
	        password = password + publickey;
	        password = ("" + CryptoJS.MD5(password)).toUpperCase();
	        login(username, password);
	    });
	}
	
	/*
	return {
	    login:login,
	    prelogin:prelogin,
	    submit:submit
	}*/
	
	module.exports = {
	    login: login,
	    prelogin: prelogin,
	    submit: submit
	};
	
	//todo

/***/ }
/******/ ]);
//# sourceMappingURL=login.js.map