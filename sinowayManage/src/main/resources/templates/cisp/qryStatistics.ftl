<div class="page-wrapper">
    <!-- Page-header start -->
    <div class="page-header card">
        <div class="card-block">
            <ul class="breadcrumb-title p-t-10">
                <li class="breadcrumb-item">
                    <a href="index"> <i class="fa fa-home"></i> </a>
                </li>
                <li class="breadcrumb-item"><a href="#!">CSIP平台</a>
                </li>
                <li class="breadcrumb-item"><a href="#!">平台查询统计</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- Page-header end -->

    <!-- Page-body start -->
    <div class="page-body">
        <div id="toolbar" class="btn-group">
            <button id="btn_add" type="button" class="btn btn-primary" onclick="add();">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>录入
            </button>
        </div>
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
    function add() {

        var content = '<div class="container"><form id="orgForm"><div class="form-group"><label for="timeframe">统计时间</label><input type="month" class="form-control" id="timeframe" name="timeframe" placeholder="会员机构数" /></div><div class="form-group"><label for="qryNum">查询次数</label><input type="number" class="form-control" id="qryNum" name="qryNum" placeholder="查询次数" /></div><div class="form-group"><label for="checkRate">查得率</label><input type="number" class="form-control" id="checkRate" name="checkRate" placeholder="查得率" /></div></form></div>'
        layer.open({
            type: 1,
            title:'会员机构统计',
            area: ['500px', '350px'],
            btn: ['确定','关闭'],
            content: content,
            yes: function(index, layero){
                orgStatistics();
            },
        });
        
    }
    
    function orgStatistics() {
        $.post("enteringQryStatistics",$('#orgForm').serialize(),function (result) {
            if (result && result.msg == 'success'){
                layer.msg('新增成功',{time:1000000});
                layer.closeAll();
                $("#main-body").load("cisp/qry");
            }
        });
    }
    
    function del(id) {
        $.post("qryDelete",{id:id},function (result) {
            if (result && result.msg == 'success'){
                layer.msg('删除成功',{time:1000000});
                layer.closeAll();
                $("#main-body").load("cisp/qry");
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
            $('#table').bootstrapTable('refresh', {url: 'qryStatistics'});
        }


        $("#table").bootstrapTable({
            url: "qryStatistics",
            cache: false,
            striped: true,
            pagination: true,
            pageList: [10, 20],
            pageSize: 10,
            pageNumber: 1,
            sidePagination: 'server',
            toolbar : "#toolbar",
            queryParams: queryParams,
            responseHandler: responseHandler,

            columns: [
                {
                    checkbox: true,
                    align: 'center'
                }, {
                    field: 'timeframe',
                    title: '统计月份'
                }, {
                    field: 'qryNum',
                    title: '查询次数',
                }, {
                    field: 'checkRate',
                    title: '查得率',
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
