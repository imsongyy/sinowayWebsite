<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>问题反馈</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="static/css/layui.css" media="all">
    <link rel="stylesheet" href="static/css/x-admin.css" media="all">
    <script src="static/js/vue.js"></script>
    <style>
        .icon_show{
            transform: rotate(90deg);
            transition: 0.4s;
        }
        .layui-colla-title{
            user-select: none;
        }
    </style>
</head>
<body>

<!--导航开始-->
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>会员服务</cite></a>
              <a><cite>问题反馈</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<!--导航结束-->
<div class="x-body" id="app">
    <blockquote class="layui-elem-quote">
        问题反馈
    </blockquote>
    <p>▷问题反馈：如有问题，请填写下表并提交，我们会尽快与您联系。</p>
    <fieldset class="layui-elem-field layui-field-title site-title">
        <legend><a name="default">信息统计</a></legend>
    </fieldset>

    <div class="layui-collapse" style="margin-bottom: 60px">
        <div class="layui-colla-item" v-for="item in data">
            <h2 class="layui-colla-title" @click="showList($event)">
                <i class="layui-icon layui-colla-icon"></i>
                {{item.question}}
                <span style="float: right">{{item.quzTime}}</span>
            </h2>
            <div class="layui-colla-content">
                <p>{{item.answer}}</p>
            </div>
        </div>
    </div>

    <form id="questionForm" action="proposeQuestion" method="post">
        <div class="layui-form-item layui-form-text">
            <input type="hidden" name="type" value="1">
            <label class="layui-form-label">问题反馈</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="question" id="question" class="layui-textarea"></textarea>
            </div>
        </div>
    </form>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1" @click="questionSubmit">立即提交</button>
        </div>
    </div>

</div>
<script src="static/lib/layui/layui.js" charset="utf-8"></script>
<script src="static/js/vendor/jquery-2.2.4.min.js"></script>

<script src="static/js/jquery.form.js"></script>
<script>

    layui.use(['form','layer'], function(){
        var form = layui.form
                ,layer = layui.layer


        $.ajax({
            type : "POST",
            url : "myQuestions",
            async : true,
            dataType : "json",
            success : function(result){
                if(result.msg == "success"){
                    htmlData.data = result.result.result;
                    console.log(htmlData.data);
                }
            }
        });

        var htmlData = {
            data:[],
        }
        var vm = new Vue({
            el : "#app",
            data : htmlData,
            methods : {
                questionSubmit : function () {
                    if($("#question").val() == ""){
                        return layer.msg('您不能输入空的问题反馈。', {
                            icon: 0
                        });
                    }
                    $("#questionForm").ajaxSubmit({
                        type : "POST",
                        url : "proposeQuestion",
                        async : true,
                        dataType : "json",
                        success : function(result){
                            if (result != null && result.msg == 'success'){
                                layer.msg('已收到您的提议,我们会及时回复您。', {
                                    icon: 1
                                });
                                $('#questionForm')[0].reset();
                            }
                        }
                    });
                },
                showList : function (event) {
                    var el = event.currentTarget;
                    if($(el).find("i").hasClass("icon_show")){
                        $(el).find("i").removeClass("icon_show");
                    }else{
                        $(el).find("i").addClass("icon_show");
                    }
                    $(el).next().stop().slideToggle();
                }
            }
        })
    });
</script>
</body>
</html>