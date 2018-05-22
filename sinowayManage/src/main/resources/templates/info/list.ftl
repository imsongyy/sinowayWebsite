<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <ul class="breadcrumb-title p-t-10">
                <li class="breadcrumb-item">
                    <a href="index.html"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">资讯管理</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">资讯列表</a>
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

    function del(id) {

        $.post("deleteInfo",{id:id},function(result){
            if(result && result.msg == 'success'){
                layer.msg("删除成功");
                $("#main-body").load("info/list");
            }else {
                layer.error(result.msg)
            }
        });
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
            $('#table').bootstrapTable('refresh', {url: 'infos'});
        }


        $("#table").bootstrapTable({
            url: "infos",
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
                    field: 'id',
                    title: '编号',
                }, {
                    field: 'title',
                    title: '标题',
                }, {
                    field: 'content',
                    title: '内容'
                }, {
                    field: 'creatorName',
                    title: '作者'
                },{
                    field: 'contentFrom',
                    title: '文章来源'
                }, {
                    title: "操作",
                    align: 'center',
                    valign: 'middle',
                    width: 160, // 定义列的宽度，单位为像素px
                    formatter: function (value, row, index) {
                        return '<button class="btn btn-primary btn-sm" onclick="del('+row.id+')">删除</button>';
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
