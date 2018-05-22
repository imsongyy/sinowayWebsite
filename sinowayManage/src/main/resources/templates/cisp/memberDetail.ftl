<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <ul class="breadcrumb-title p-t-10">
                <li class="breadcrumb-item">
                    <a href="index.html"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">会员管理</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">会员信息管理</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- Page-header end -->

    <!-- Page body start -->
    <div class="page-body">
        <div class="row">
            <div class="col-sm-12">
                <!-- Basic Form Inputs card start -->
                <div class="card">
                    <div class="card-block">
                        <h4 class="sub-title">会员信息</h4>
                        <form id="customerForm" action="saveCustomer" method="post">
                            <input type="hidden" name="id" id="id" value="${customer.id!}"/>
                            <#--<input type="hidden" name="uuid" id="uuid" value="${customer.uuid!}"/>-->
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">机构全称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="orgFullname" value="${customer.orgFullname!}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">机构简称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="orgShortname" value="${customer.orgShortname!}"
                                           placeholder="机构简称">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">主营业务</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="primaryBusiness" value="${customer.primaryBusiness!}"
                                           placeholder="主营业务">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">官方网址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="siteAddr" value="${customer.siteAddr!}"
                                           placeholder="官方网址">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">征信负责人姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="creditChargePerson" value="${customer.creditChargePerson!}"
                                           placeholder="征信负责人姓名">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">联系电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="contactsNumber" value="${customer.contactsNumber!}"
                                           placeholder="联系电话">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">电子邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="email" value="${customer.email!}"
                                           placeholder="电子邮箱">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">社会信用代码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="socialCreditCode" value="${customer.socialCreditCode!}"
                                           placeholder="社会信用代码">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">办公电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="officePhone" value="${customer.officePhone!}"
                                           placeholder="办公电话">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">传真号码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="faxNumber" value="${customer.faxNumber!}"
                                           placeholder="传真号码">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">注册资本</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="registCapital" value="${customer.registCapital!}"
                                           placeholder="注册资本">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">注册地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="registAddr" value="${customer.registAddr!}"
                                           placeholder="注册地址">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">法人代表姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="legalName" value="${customer.legalName!}"
                                           placeholder="法人代表姓名">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">总经理姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="generalManagerName" value="${customer.generalManagerName!}"
                                           placeholder="总经理姓名">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">办公地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="officeAddr" value="${customer.officeAddr!}"
                                           placeholder="办公地址">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">邮政编码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="postalCode" value="${customer.postalCode!}"
                                           placeholder="邮政编码">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">终端IP地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="ipAddr" value="${customer.ipAddr!}"
                                           placeholder="终端IP地址">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">机构负责人姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="agencyLeader" value="${customer.agencyLeader!}"
                                           placeholder="机构负责人姓名">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">账户名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="username" value="${customer.username!}"
                                           placeholder="机构负责人姓名">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">账户密码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="password" value="${customer.password!}"
                                           placeholder="机构负责人姓名">
                                </div>
                            </div>
                        <#if customer.auditStatus == 3>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">审核状态</label>
                                <div class="col-sm-10">
                                    <select name="auditStatus" class="form-control">
                                        <option value="1">审核通过</option>
                                        <option value="2">审核拒绝</option>
                                    </select>
                                </div>
                            </div>
                        </#if>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-5 pull-right">
                                    <button id="save" type="button" class="btn btn-primary right">提交
                                    </button>
                                    <button type="reset" class="btn btn-primary right">取消
                                    </button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Page body end -->
</div>

<script type="text/javascript">

    $('#save').click(function () {
        $('#customerForm').submit();
    })

    $('#customerForm').ajaxForm(function(result) {
        debugger
        if (result != null && result.msg == 'success'){
            $("#main-body").load("cisp/members")
        }
    });

</script>