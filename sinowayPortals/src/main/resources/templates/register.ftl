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
<style>
    .rightBox label {
        padding: 5px 0;
        line-height: 30px;
    }
</style>
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
                            <span class="bigSize">会员注册</span>
                        </div>
                        <div class="tabs tabs-show">
                            <form action="cispRegister" id="form" enctype="multipart/form-data">
                                <label><span>机构名称：</span><input name="orgFullname" type="text" id="orgFullname" placeholder="请输入机构名称"/></label>
                                <label><span>主营业务：</span><input name="primaryBusiness" type="text" id="primaryBusiness" placeholder="请输入主营业务"/></label>
                                <label><span>官方网址：</span><input name="siteAddr" type="text" id="siteAddr" placeholder="请输入机构官方网址"/></label>
                                <label><span>联系人：</span><input name="contacts" type="text" id="contacts" placeholder="请输入联系人"/></label>
                                <label><span>手机号：</span><input name="contactsNumber" type="tel" id="contactsNumber" placeholder="请输入手机号"/></label>
                                <label><span>验证码：</span><input name="msgCode" type="tel" id="msgCode" placeholder="请输入验证码" class="smallInput"/><button type="button" id="getSms" onclick="sendSms()">获取验证码</button></label>
                                <label><span>邮箱：</span><input name="email" type="text" id="email" placeholder="请输入邮箱"/></label>
                            </form>
                            <button class="loginBtn">立即注册</button>
                            <p>已注册，<a href="login">立即登录</a></p>
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
</script>
<script>
    var $phoneNum = $("#contactsNumber");
    var $email = $("#email");
    var $orgFullname = $("#orgFullname");
    var $primaryBusiness = $("#primaryBusiness");
    var $siteAddr = $("#siteAddr");
    var $contacts = $("#contacts");
    var $msgCode = $("#msgCode");
    //非空校验



    //注册点击事件
    $(".loginBtn").on("click",function(){
        cancleTip();
        if(isNull($orgFullname.val())){
            return showTip($orgFullname,"机构名称不能为空");
        }
        if(isNull($primaryBusiness.val())){
            return showTip($primaryBusiness,"主营业务不能为空");
        }
        if(isNull($siteAddr.val())){
            return showTip($siteAddr,"官方网址不能为空");
        }
        if(isNull($contacts.val())){
            return showTip($contacts,"联系人不能为空");
        }
        if(checkMobile($phoneNum.val())!=""){
            return showTip($phoneNum,checkMobile($phoneNum.val()));
        }
        if(isNull($msgCode.val())){
            return showTip($msgCode,"验证码不能为空");
        }
        if(checkEmail($email.val())){
            return showTip($email,checkEmail($email.val()));
        }
        $("#form").ajaxSubmit({
        	type : "POST",
        	url : "cispRegister",
        	async : true,
        	dataType : "json",
        	success : function(result){
        	    if(result.msg == 'success'){
                    tipWrap(2,"您的信息已经提交，我们审核完您的信息后会尽快与您联系！")
                }else{
                    tipWrap(0,"系统错误，请稍后再试！")
                }
        	}
        });
		
    })
    //获取验证码

</script>
</body>
</html>