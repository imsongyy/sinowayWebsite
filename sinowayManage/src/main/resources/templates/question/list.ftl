<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <ul class="breadcrumb-title p-t-10">
                <li class="breadcrumb-item">
                    <a href="index.html"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">问题反馈</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">问题列表</a>
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
    
    function detail(id) {
        $("#main-body").load("questionDetail?id="+id);
    }

    $(document).ready(function () {
        function queryParams(params) {
            params.pageSize = params.limit;
            params.pageIndex = params.offset / params.limit + 1;
            return params;
        }

        function responseHandler(result) {
            result = result.result;

            if (result == null){
                layer.msg("查无数据");
                return;
            }
            return {
                total: result.totalElements,
                rows: result.content
            };
        };

        function refresh() {
            $('#table').bootstrapTable('refresh', {url: 'questions'});
        }


        $("#table").bootstrapTable({
            url: "questions",
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
                    field: 'username',
                    title: '提问人'
                },  {
                    field: 'email',
                    title: '邮箱'
                }, {
                    field: 'question',
                    title: '问题描述',
                }, {
                    field: 'quzTime',
                    title: '提出时间'
                }, {
                    field: 'dealStatus',
                    title: '问题状态',
                    formatter:function (value) {

                        if (value){
                            return "已处理";
                        }else {
                            return "未处理";
                        }

                    }
                },{
                    title: "操作",
                    align: 'center',
                    valign: 'middle',
                    width: 160, // 定义列的宽度，单位为像素px
                    formatter: function (value, row, index) {
                        return '<a class="btn btn-primary btn-sm" onclick="detail('+row.id+')">详情</a>';
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
