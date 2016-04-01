import login from './service';

login.submit();//侦听登录按钮的点击事件
login.prelogin();//取得一次性的密钥


$(function(){
    $('.login-form').keyup(function(event){
        if (event.keyCode == 13) {
            $('#submit').trigger('click');
        }
    });
});