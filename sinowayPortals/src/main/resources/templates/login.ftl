<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <meta name="author" content="colorlib">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>北京华道征信有限公司</title>
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
    <link rel="stylesheet" href="static/css/font-awesome.css">
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <link rel="stylesheet" href="static/css/main.css">
    <link rel="stylesheet" href="static/css/style.css"/>
</head>
<body>

<!-- start banner Area -->
<section class="banner-area" style="background: url('static/img/loginBj.jpg') no-repeat;background-size: 100% 100%;overflow: hidden">
    <!-- Start Header Area -->
    <header class="default-header" style="transform: translateZ(0)">
        <nav class="navbar navbar-expand-lg  navbar-light">
            <div class="container">
                <a class="navbar-brand" href="index.html">
                    <img style="width: 80px;transform: scale(1.5);display: block" src="static/img/logo.png" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="lnr lnr-menu"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li><a href="index#home">个人征信机构</a></li>
                        <li><a href="index#service">CISP平台服务</a></li>
                        <li><a href="index#feature">信息主体查询</a></li>
                        <li><a href="index#price">行业资讯</a></li>
                        <li><a href="index#faq">关于华道</a></li>
                        <li><a href="index#footer">联系我们</a></li>
                        <!-- Dropdown -->
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                会员服务
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="login">登录会员</a>
                                <a class="dropdown-item" href="register">注册会员</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- End Header Area -->
    <div class="">
        <div class="row justify-content-end fullscreen align-items-center">
            <div class="col-lg-12 col-md-12 banner-left">
                <div class="container">
                    <div class="rightBox">
                        <div class="rightBox_tabs" style="margin: 20px 30px 30px">
                            <span class="bigSize">会员登录</span>
                        </div>
                        <div class="tabs tabs-show">
                            <form action="cispRegister" id="form" enctype="multipart/form-data">
                                <label><span>用户名：</span><input name="username" type="text" id="username" placeholder="请输入用户名"/></label>
                                <label><span>密码：</span><input name="password" type="password" id="password" placeholder="请输入密码"/></label>
                                <label><span>验证码：</span><input name="verifyCode" class="smallInput" id="verifyCode" type="tel" placeholder="输入验证码"/><img id="sms" onclick="getsms()" src="generateKaptcha" alt=""/></label>
                            </form>
                            <button class="loginBtn">立即登录</button>
                            <p>还未注册，<a href="register">立即注册</a></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>



<!-- start footer Area -->
<footer id="footer" style="position: relative">

    <!-- .subfooter start -->
    <div class="subfooter">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <p class="text-center">版权所有 &copy; 2014.北京华道征信有限公司 京ICP备14051116号</p>
                </div>
            </div>
        </div>
    </div>
    <!-- .subfooter end -->

</footer>

<script src="static/js/vendor/jquery-2.2.4.min.js"></script>
<script src="static/js/vendor/bootstrap.min.js"></script>
<script src="static/js/jquery.form.js"></script>
<script src="static/js/comment.js"></script>

<script>
    var height = $(window).height()-102;
    $(".fullscreen").css({height: height+"px"});

    function getsms() {
        $("#sms").attr("src","generateKaptcha")
    }

    var $username = $("#username");
    var $password = $("#password");
    var $verifyCode = $("#verifyCode");
    //非空校验



    //注册点击事件
    $(".loginBtn").on("click",function(){
        cancleTip();
        if(isNull($username.val())){
            return showTip($username,"用户名不能为空");
        }
        if(isNull($password.val())){
            return showTip($password,"密码不能为空");
        }
        if(isNull($verifyCode.val())){
            return showTip($verifyCode,"验证码不能为空");
        }
        $("#form").ajaxSubmit({
            type : "POST",
            url : "signIn",
            async : true,
            dataType : "json",
            success : function(result){
                getsms();
                if(result.msg != "success"){
                    $("#form")[0].reset();
                    return showTip($(".bigSize"),result.msg);
                }
                window.location.href="service";
            }
        });
    })
    //获取验证码

</script>
</body>
</html>