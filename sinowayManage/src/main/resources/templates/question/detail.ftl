<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <ul class="breadcrumb-title b-t-default p-t-10">
                <li class="breadcrumb-item">
                    <a href="index.html"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">问题反馈</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">详情</a>
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
                        <form >
                            <input type="hidden" id="qid" value="${question.id!}">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="username">提出人</label>
                                <div class="col-sm-10">
                                    <span class="form-control">${question.username!}</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="email">电子邮箱</label>
                                <div class="col-sm-10">
                                    <span class="form-control">${question.email!}</span>
                                </div>
                            </div>
                            <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="content">问题描述</label>
                                <div class="col-sm-10">
                                    <span class="form-control">${question.question!}</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="quzTime">提出时间</label>
                                <div class="col-sm-10">
                                    <span class="form-control">${question.quzTime!}</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="quzTime">处理结果</label>
                                <div class="col-sm-10">
                                    <span class="form-control">${question.dealStatus!?string('已处理', '未处理') }</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" for="quzTime">问题回复</label>
                                <div class="col-sm-10">
                                    <textarea id="answer" rows="10" cols="94">${question.answer! }</textarea>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-2">
                                    <button id="delBtn" type="button" class="btn btn-primary">删除
                                    </button>
                                </div>
                        <#if question.dealStatus != true>
                                <div class="col-sm-2">
                                    <button id="dealBtn" type="button" class="btn btn-primary">提交
                                    </button>
                                </div>
                        </#if>
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
    $('#dealBtn').click(function () {
        $.post("dealQuestion",{qid:$('#qid').val(),answer:$('#answer').val()},function (result) {
            if (result && result.msg == 'success'){
                layer.msg('问题状态修改为已处理');
                $("#main-body").load("questionList");
            }
        });
    });


    $('#delBtn').click(function () {
        $.post("delQuestion",{qid:$('#qid').val(),answer:$('#answer').val()},function (result) {
            if (result && result.msg == 'success'){
                layer.msg('删除成功');
                $("#main-body").load("questionList");
            }
        });
    });


</script>
