/**
 * Created by dell on 2018/4/21.
 */
layui.use(['form','layer'], function(){
    var form = layui.form
        ,layer = layui.layer


    $("#submit").click(function () {
        $("#form").ajaxSubmit({
            type : "POST",
            url : "customerChangeApply",
            async : true,
            dataType : "json",
            success : function(result){
                if(result.msg == "success"){
                    layer.msg('变更信息申请已提交，请等待审核', {
                        icon: 1
                    });
                }
            }
        });
})

});