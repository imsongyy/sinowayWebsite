<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>驱动</title>
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
<input id="dataUrl" type="text" hidden value="drivers">
<!--导航开始-->
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>下载中心</cite></a>
              <a><cite>驱动</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<!--导航结束-->
<div class="x-body" id="app">
    <blockquote class="layui-elem-quote">
        驱动
    </blockquote>
    <p>▷完成与客户应用系统的数据接口协议，实现输入参数接收通道</br>
        ▷完成数据层链接搭建，实现与华道CISP平台的数据交互</br>
        ▷完成应用层数据安全协议，实现查询客户端数据报送和征信报告保存</br>
        ▷完成智能协议设计，实现客户端系统灾难恢复、运行日志记录</br>
        ▷独立主机、自循环式运行，适应性强、系统需求低
    </p>
    <fieldset class="layui-elem-field layui-field-title site-title">
        <legend><a name="default">信息统计</a></legend>
    </fieldset>

    <table class="layui-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>驱动名称</th>
            <th>驱动版本</th>
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