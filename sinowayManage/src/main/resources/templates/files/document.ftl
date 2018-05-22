<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <ul class="breadcrumb-title b-t-default p-t-10">
                <li class="breadcrumb-item">
                    <a href="index.html"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">下载管理</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">文档</a>
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
                        <form id="documentForm" method="post" action="createDocument" enctype="multipart/form-data">
                            <#--<div class="form-group row">-->
                                <#--<label class="col-sm-2 col-form-label" for="type">类型</label>-->
                                <#--<div class="col-sm-10">-->
                                    <#--<select id="type" name="type" class="form-control">-->
                                        <#--<option value="policy">政策法规</option>-->
                                        <#--<option value="country">国内外资讯</option>-->
                                        <#--<option value="special">专题研究</option>-->
                                        <#--<option value="related">相关行业统计数据</option>-->
                                    <#--</select>-->
                                <#--</div>-->
                            <#--</div>-->
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="dName">文档名称</label>
                                <div class="col-sm-10">
                                    <input type="text" id="dName" name="dName" class="form-control" placeholder="文档名称">
                                </div>
                            </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="dVersion">文档版本</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="dVersion" name="dVersion" class="form-control" placeholder="文档版本">
                                    </div>
                                </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">上传文档</label>
                                <div class="col-sm-10">
                                    <input type="file" name="file" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-5">
                                    <button id="submit" type="button" class="btn btn-primary right">提交
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
    $('#submit').click(function () {
        $('#documentForm').submit();
    })

    $('#documentForm').ajaxForm(function(result) {
        if (result != null && result.msg == 'success'){
            $("#main-body").load("documentList")
        }
    });



</script>
