<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <title>登录</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="static/js/html5shiv.js"></script>
      <script src="static/js/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Gradient Able Bootstrap admin template made using Bootstrap 4. The starter version of Gradient Able is completely free for personal project." />
    <meta name="keywords" content="free dashboard template, free admin, free bootstrap template, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="codedthemes">
    <!-- Favicon icon -->
    <link rel="icon" href="static/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <#--<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600" rel="stylesheet">-->
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/bootstrapValidator.min.css">

    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="static/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="static/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
</head>

<body class="fix-menu">
        <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="loader-track">
            <div class="loader-bar"></div>
        </div>
    </div>
    <!-- Pre-loader end -->

    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto" style="margin: 0 auto">
                        <form class="md-float-material" id="loginForm">
                            <div class="text-center">
                                <img src="static/images/logo.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">登&nbsp;&nbsp;录</h3>
                                    </div>
                                </div>
                                <hr/>
                                <div class="form-group">
                                    <input type="text" name="username" class="form-control" placeholder="请输入用户名" value="admin">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control" placeholder="请输入密码" value="123456">
                                </div>
                                <#--<div class="row m-t-25 text-left">-->
                                    <#--<div class="col-sm-7 col-xs-12">-->
                                        <#--<div class="checkbox-fade fade-in-primary">-->
                                            <#--<label>-->
                                                <#--<input type="checkbox" value="">-->
                                                <#--<span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>-->
                                                <#--<span class="text-inverse">记住</span>-->
                                            <#--</label>-->
                                        <#--</div>-->
                                    <#--</div>-->
                                    <#--<div class="col-sm-5 col-xs-12 forgot-phone text-right">-->
                                        <#--<a href="auth-reset-password.html" class="text-right f-w-600 text-inverse"> 忘记密码?</a>-->
                                    <#--</div>-->
                                <#--</div>-->
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="button" onclick="login()" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">登&nbsp;&nbsp;录</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">${msg!}Thank you and enjoy our website.</p>
                                        <p class="text-inverse text-left"><b>Your Authentication Team</b></p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="static/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                    </div>
                                </div>

                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="static/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="static/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="static/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="static/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="static/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
    <!-- Warning Section Ends -->
    <!-- Required Jquery -->
    <script type="text/javascript" src="static/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="static/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="static/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="static/js/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="static/js/modernizr/css-scrollbars.js"></script>
    <script type="text/javascript" src="static/js/common-pages.js"></script>
    <script type="text/javascript" src="static/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="static/js/formValidator.js"></script>

    <script type="text/javascript">
        function login() {

            var bootstrapValidator = $("form").data('bootstrapValidator');
            bootstrapValidator.validate();

            if (!bootstrapValidator.isValid()){
                return;
            }

            $.post("sign_in",$("#loginForm").serialize(),function(result){
                result = JSON.parse(result);
                if(result && result.msg == 'success'){
                    window.location.href = "index";
                }else {
                    alert(result.msg)
                }
            });
        }
    </script>
</body>

</html>
