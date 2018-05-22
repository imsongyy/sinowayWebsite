/**
 * Created by dell on 2018/4/21.
 */
layui.use(['layer'], function(){
    var layer = layui.layer


    var htmlData = {
        data:[],
    }
    $.ajax({
        type : "POST",
        url : "periodicals",
        async : true,
        dataType : "json",
        success : function(result){
            htmlData.data = result.result.result.content;
            console.log(htmlData.data);
        }
    })
    var vm = new Vue({
        el : "#app",
        data : htmlData,
        methods : {
            getfile : function (name) {
                window.open("/getFile?fileName="+name);
            }
        }
    })
});