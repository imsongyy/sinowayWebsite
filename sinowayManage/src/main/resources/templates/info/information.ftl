<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <h5 class="m-b-10">资讯编辑</h5>
            <p class="text-muted m-b-10">新建资讯编辑</p>
            <ul class="breadcrumb-title b-t-default p-t-10">
                <li class="breadcrumb-item">
                    <a href="index.html"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">资讯管理</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">资讯编辑</a>
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
                    <#--<div class="card-header">-->
                        <#--<h5>Basic Form Inputs</h5>-->
                        <#--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
                        <#--<div class="card-header-right"><i-->
                                <#--class="icofont icofont-spinner-alt-5"></i></div>-->

                        <#--<div class="card-header-right">-->
                            <#--<i class="icofont icofont-spinner-alt-5"></i>-->
                        <#--</div>-->

                    <#--</div>-->
                    <div class="card-block">
                        <h4 class="sub-title">Basic Inputs</h4>
                        <form id="infoForm" method="post" action="createInformation" enctype="multipart/form-data">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="type">类型</label>
                                <div class="col-sm-10">
                                    <select id="type" name="type" class="form-control">
                                        <option value="policy">政策法规</option>
                                        <option value="country">国内外资讯</option>
                                        <option value="special">专题研究</option>
                                        <option value="related">相关行业统计数据</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="title">标题</label>
                                <div class="col-sm-10">
                                    <input type="text" id="title" name="title" class="form-control" placeholder="请输入标题">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="contentFrom">来源</label>
                                <#--<div class="col-sm-10">-->
                                    <#--<select id="contentFrom" name="contentFrom" class="form-control">-->
                                        <#--<option value="Google">Google</option>-->
                                        <#--<option value="百度">百度</option>-->
                                        <#--<option value="搜狐">搜狐</option>-->
                                    <#--</select>-->
                                <#--</div>-->
                                <div class="col-sm-10">
                                    <input type="text" id="contentFrom" name="contentFrom" class="form-control" placeholder="请输入资讯来源">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">背景图</label>
                                <div class="col-sm-10">
                                    <input type="file" name="bgPic" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">内容</label>
                                <div class="col-sm-10">
                                    <textarea id="content" name="content" class="form-control" rows="10" cols="38"></textarea>
                                    <script type="text/javascript">CKEDITOR.replace('content')</script>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-5">
                                    <button id="submitInfo" type="button" class="btn btn-primary right">提交
                                    </button>
                                    <button type="reset" class="btn btn-primary right">重置
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Basic Form Inputs card end -->
            </div>
        </div>
    </div>
    <!-- Page body end -->
</div>
<script type="text/javascript">
    $('#submitInfo').click(function () {
        var content = CKEDITOR.instances.content.getData();
        $('#content').val(content);
        $('#infoForm').submit();
    })

    $('#infoForm').ajaxForm(function(result) {
        if (result != null && result.msg == 'success'){
            $("#main-body").load("info/list")
        }
    });



</script>
