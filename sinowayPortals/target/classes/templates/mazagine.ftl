<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>期刊</title>
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
<input id="dataUrl" type="text" hidden value="periodicals">
<!--导航开始-->
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>下载中心</cite></a>
              <a><cite>期刊</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<!--导航结束-->
<div class="x-body" id="app">
    <blockquote class="layui-elem-quote">
        期刊
    </blockquote>
    <p>▷CISP DIGEST是华道征信CISP平台推出的内部刊物</br>
        ▷主要关注与消费信贷行业发展相关的各类资讯和研究成果</br>
        ▷包括 “华道动态”、“新闻热点”、“征信研究”、“统计数据”、“会员天地”等栏目。</p>
    <fieldset class="layui-elem-field layui-field-title site-title">
        <legend><a name="default">信息统计</a></legend>
    </fieldset>

    <table class="layui-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>期刊名称</th>
            <th>发布时间</th>
            <th style="max-width: 100px">操作</th>
        </tr>
        </thead>
        <tbody id="x-link">
        <tr v-for="(item,index) in data">
            <td>{{(nowpage-1)*10+index | formatIndex}}</td>
            <td>{{item.pName}}</td>
            <td>{{item.uploadTime}}</td>
            <td  style="max-width: 100px">
                <a v-bind:href="'getFile?fileName='+item.fileName" target=_blank>
                    <button class="layui-btn layui-btn-sm layui-btn-normal">查看</button>
                </a>
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