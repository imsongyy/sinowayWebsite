<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>会员信息变更申请</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="static/css/x-admin.css" media="all">
    <style>
        .layui-form-label{
            width: 170px;
        }
        .layui-form-item .layui-inline{
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<!--导航开始-->
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>会员服务</cite></a>
              <a><cite>会员信息变更申请</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<!--导航结束-->
<div class="x-body" id="app">
    <blockquote class="layui-elem-quote">
        会员信息变更申请
    </blockquote>
    <p>▷如果会员信息发生变更，请填写下表并提交变更申请。我们会尽快处理。</p>
    <fieldset class="layui-elem-field layui-field-title site-title">
        <legend><a name="default">变更信息</a></legend>
    </fieldset>
    <form class="layui-form" id="form" action="">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">申请机构全称</label>
                <div class="layui-input-inline">
                    <input type="text" name="orgFullname" value="${customer.orgFullname!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">主营业务</label>
                <div class="layui-input-inline">
                    <input type="text" name="primaryBusiness" value="${customer.primaryBusiness!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">社会信用代码</label>
                <div class="layui-input-inline">
                    <input type="text" name="socialCreditCode" value="${customer.socialCreditCode!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">机构简称</label>
                <div class="layui-input-inline">
                    <input type="text" name="orgShortname" value="${customer.orgShortname!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">办公电话</label>
                <div class="layui-input-inline">
                    <input type="text" name="officePhone" value="${customer.officePhone!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">传真号码</label>
                <div class="layui-input-inline">
                    <input type="text" name="faxNumber" value="${customer.faxNumber!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">注册资本</label>
                <div class="layui-input-inline">
                    <input type="number" name="registCapital" value="${customer.registCapital!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">联系人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="contacts" value="${customer.contacts!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-inline">
                    <input type="text" name="contactsNumber" value="${customer.contactsNumber!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">法人代表姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="legalName" value="${customer.legalName!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">总经理姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="generalManagerName" value="${customer.generalManagerName!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">注册地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="registAddr" value="${customer.registAddr!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">办公地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="officeAddr" value="${customer.officeAddr!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">邮政编码</label>
                <div class="layui-input-inline">
                    <input type="text" name="postalCode" value="${customer.postalCode!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">网站地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="siteAddr" value="${customer.siteAddr!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">征信负责人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="creditChargePerson" value="${customer.creditChargePerson!}" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">电子邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" value="${customer.email!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">终端IP地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="ipAddr" value="${customer.ipAddr!}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">机构负责人</label>
                <div class="layui-input-inline">
                    <input type="text" name="agencyLeader" value="${customer.agencyLeader!}" class="layui-input">
                </div>
            </div>
            <input type="hidden"  name="id" value="${customer.id!}" class="layui-input">
        </div>
    </form>
    <button class="layui-btn layui-btn-fluid" id="submit" style="margin: 20px auto;display: block">确认提交</button>

</div>
<script src="static/js/vendor/jquery-2.2.4.min.js"></script>
<script src="static/lib/layui/layui.js" charset="utf-8"></script>
<script src="static/js/service/inforChange.js"></script>
<script src="static/js/jquery.form.js"></script>
</body>
</html>