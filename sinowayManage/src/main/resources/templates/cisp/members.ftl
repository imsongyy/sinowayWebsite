<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <ul class="breadcrumb-title p-t-10">
                <li class="breadcrumb-item">
                    <a href="index.html"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">CSIP平台</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">会员管理</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- Page-header end -->

    <!-- Page-body start -->
    <div class="page-body">

        <div class="card">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <table class="table" id="table">
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    function allocation(id) {

        var content = '<div class="container"><input type="hidden" id="uid" value="'+id+'">' +
                '<form><div class="form-group"> <label for="username">用户名</label>' +
                ' <input type="text" class="form-control" id="username" name="username" placeholder="用户名"> </div> ' +
                '<div class="form-group"> <label for="password">密码</label><input type="password" class="form-control" id="password" name="password" placeholder="密码"> ' +
                '</div></form><div>'
        layer.open({
            type: 1,
            title:'分配账户密码',
            area: ['500px', '350px'],
            btn: ['确定','关闭'],
            content: content,
            yes: function(index, layero){
                allocationPwd();
            },
        });
        
    }
    
    function allocationPwd() {
        $.post("allocation",{uid:$('#uid').val(),username:$('#username').val(),password:$('#password').val()},function (result) {
            if (result && result.msg == 'success'){
                layer.msg('用户密码设置成功',{time:1000000});
                layer.closeAll();
                $("#main-body").load("cisp/members");
            }
        });
    }



    function memberActive(uid) {
        $("#main-body").load("cisp/memberDetail?uid="+uid);
    }

    $(document).ready(function () {
        function queryParams(params) {
            params.pageSize = params.limit;
            params.pageIndex = params.offset / params.limit + 1;
            return params;
        }

        function responseHandler(result) {
            result = result.result;
            return {
                total: result.totalElements,
                rows: result.content
            };
        };

        function refresh() {
            $('#table').bootstrapTable('refresh', {url: 'cispMembers'});
        }


        $("#table").bootstrapTable({
            url: "cispMembers",
            cache: false,
            striped: true,
            pagination: true,
            pageList: [10, 20],
            pageSize: 10,
            pageNumber: 1,
            sidePagination: 'server',
            queryParams: queryParams,
            responseHandler: responseHandler,

            columns: [
                {
                    checkbox: true,
                    align: 'center'
                }, {
                    field: 'orgFullname',
                    title: '机构名称'
                }, {
                    field: 'primaryBusiness',
                    title: '主营业务',
                }, {
                    field: 'siteAddr',
                    title: '官方网址',
                    formatter:function (value) {
                        return '<a href="'+value+'" target="_blank">'+value+'</a>'
                    }
                }, {
                    field: 'contacts',
                    title: '联系人',
                }, {
                    field: 'contactsNumber',
                    title: '电话',
                }, {
                    field: 'auditStatus',
                    title: '审核状态',
                    formatter:function (value) {
                        if (value == 0 ){
                            return "正常";
                        }
                        if (value == 1 ){
                            return "审核通过";
                        }
                        if (value == 2 ){
                            return "审核拒绝";
                        }
                        if (value == 3){
                            return "待审核";
                        }

                    }
                }, {
                    title: "操作",
                    align: 'center',
                    valign: 'middle',
                    width: 160, // 定义列的宽度，单位为像素px
                    formatter: function (value, row, index) {
                        return '<button class="btn btn-primary btn-sm" onclick="memberActive('+row.id+')">详情</button> &nbsp;&nbsp;<button class="btn btn-primary btn-sm" onclick="allocation('+row.id+')">分配账户</button>';
                    }
                }
            ],
            onLoadSuccess: function () {  //加载成功时执行
                console.info("加载成功");
            },
            onLoadError: function () {  //加载失败时执行
                console.info("加载数据失败");
            }

        })
    })
</script>
