<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <ul class="breadcrumb-title p-t-10">
                <li class="breadcrumb-item">
                    <a href="index.html"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">下载管理</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">期刊管理</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- Page-header end -->

    <!-- Page-body start -->
    <div class="page-body">

        <div class="card">
            <div class="card-block table-border-style">
                <div id="toolbar">

                    <form class="form-inline mgl_125">
                        <input type="hidden" id="typeId" name="typeId"/>
                        <div class="form-group">
                            <select name="condition" id="condition" class="form-control">
                                <option value="">选择查询条件</option>
                                <option value="title">标题</option>
                                <option value="author">作者</option>
                                <option value="ziliaoFrom">来源</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <input type="text" id="searchContent" class="form-control" placeholder="请输入搜索内容">
                        </div>

                        <div class="form-group">
                            <a href="javascript:void(0)" class="btn btn-info" onclick="createPeriodical()">新建</a>
                        </div>




                    </form>
                </div>
                <div class="table-responsive">
                    <table class="table" id="table" data-toolbar="#toolbar">
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    
    function createPeriodical() {
        $("#main-body").load("periodical");
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
            $('#table').bootstrapTable('refresh', {url: 'periodicals'});
        }


        $("#table").bootstrapTable({
            url: "periodicals",
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
                    field: 'pName',
                    title: '期刊名称'
                }, {
                    field: 'uploadTime',
                    title: '上传时间',
                }, {
                    field: 'uploader',
                    title: '上传人'
                }, {
                    title: "操作",
                    align: 'center',
                    valign: 'middle',
                    width: 160, // 定义列的宽度，单位为像素px
                    formatter: function (value, row, index) {
                        return '<a class="btn btn-primary btn-sm" target="_blank" href="getFile?fileName='+row.fileName+'")">查看</a>&nbsp;&nbsp;<a class="btn btn-primary btn-sm" target="_blank" download="'+row.pName+'" href="getFile?fileName='+row.fileName+'")">下载</a>';
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
