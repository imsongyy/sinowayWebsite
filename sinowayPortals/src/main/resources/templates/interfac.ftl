<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>接口文档</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="static/css/x-admin.css" media="all">
    <script src="static/js/vue.js"></script>
</head>
<body>
<input id="dataUrl" type="text" hidden value="documents">
<!--导航开始-->
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>下载中心</cite></a>
              <a><cite>接口文档</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<!--导航结束-->
<div class="x-body" id="app">
    <blockquote class="layui-elem-quote">
        接口文档
    </blockquote>
    <p>▷描述华道CISP平台接口规范、安全传输协议、字段定义、征信报告解析等相关内容</br>
        ▷提供开发测试环境、测试代码DEMO</br>
        ▷提供测试用例，技术支持团队辅助开发</br>
        ▷提供技术支持网站和技术交流群实时沟通
    </p>
    <fieldset class="layui-elem-field layui-field-title site-title">
        <legend><a name="default">信息统计</a></legend>
    </fieldset>

    <table class="layui-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>文档名称</th>
            <th>版本</th>
            <th>发布时间</th>
            <th>上传作者</th>
            <th style="max-width: 100px">操作</th>
        </tr>
        </thead>
        <tbody id="x-link">
        <tr v-for="(item,index) in data">
            <td>{{(nowpage-1)*10+index | formatIndex}}</td>
            <td>{{item.dName}}</td>
            <td>{{item.dVersion}}</td>
            <td>{{item.uploadTime}}</td>
            <td>{{item.uploader}}</td>
            <td  style="max-width: 100px">
                <a v-bind:href="'getFile?fileName='+item.fileName" v-bind:download="item.fileName">
                    <button class="layui-btn layui-btn-sm">下载</button>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div id="page" style="user-select:none;text-align: center"></div>
<script src="static/js/vendor/jquery-2.2.4.min.js"></script>
<script src="static/lib/layui/layui.js" charset="utf-8"></script>
<script src="static/js/service/drive.js"></script>
</body>
</html>