/**
 * Created by dell on 2018/4/21.
 */
layui.use(['laypage','layer'], function(){
    var laypage = layui.laypage,
        layer = layui.layer
    var firstGet = true;
    var url = $("#dataUrl").val();

    getData();
    function getData(curr) {
        var data = {"pageIndex" : curr}
        $.ajax({
            type : "POST",
            url : url,
            async : true,
            data : data,
            dataType : "json",
            success : function(result){
                htmlData.data = result.result.result.content;
                var pages = result.result.result.totalPages;
                freshen(pages);
            }
        })
    }
    function freshen(pages) {
        if(firstGet){
            laypage({
                cont: 'page'
                ,pages: pages
                ,first: 1
                ,last: pages
                ,prev: '<em><</em>'
                ,next: '<em>></em>'
                ,jump: function(obj, first) {
                    if (!first) {
                        getData(obj.curr);
                    }
                    htmlData.nowpage = obj.curr
                }
            });
            firstGet = false;
        }
    }
    var htmlData = {
        data:[],
        nowpage : 1
    }
    var vm = new Vue({
        el : "#app",
        data : htmlData,
        filters:{
            formatIndex:function(value){
                value = value+1;
                if(value < 10){
                    value = "0"+value
                }
                return value;
            }
        },
        methods : {

        }
    })
});