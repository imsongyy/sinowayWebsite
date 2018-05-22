/**
 * Created by dell on 2018/4/20.
 */

var curWwwPath = window.document.location.href;
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
var localhostPaht = curWwwPath.substring(0, pos);
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
var basePath = localhostPaht+projectName;


function isNull(arg1) {
    if(arg1!=null){
        if (String.prototype.trim) {
            arg1=arg1.trim();
        }else{
            arg1=arg1.replace(/^\s*|\s*$/g, "");
        }
    }

    return !arg1 && arg1!==0 && typeof arg1!=="boolean"?true:false;
}
//手机号校验
function checkMobile(mobile) {
    //var mobile = $("#phone_num").val();
    var message = "";
    var mobileReg = /^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|4|5|6|7|8|9]|166|198|199|17[0|1|2|3|5|6|7|8|9])\d{8}$/
    if(isNull(mobile)){
        message = "请输入手机号";
    }else if(!mobileReg.test(mobile)) {
        message = "请输入正确的手机号";
    }
    return message;
}
//邮箱校验
function checkEmail(email){
    var message = "";
    //var email = $("#email").val();
    //1、邮箱不能以 - _ .以及其它特殊字符开头和结束2、邮箱域名结尾为2~5个字母，比如cn、com、name
    var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,5}$/;
    if(isNull(email)){
        message = "请输入邮箱";
    }else if(!reg.test(email)){
        message =  "请输入正确的邮箱地址";
    }
    return message;
}
/**
 *   错误提示框
 *   event 校验的元素
 *   message 错误信息
 */
function showTip(event,message){
    var showhtml = '<div class="ketchup-error-container" style="display: block;"><ol><li>'+message+'</li></ol><span></span></div>'
    $("body").append(showhtml);
    var offset = event.offset();
    $(".ketchup-error-container").css("left",(offset.left+180)+"px");
    var height = $(".ketchup-error-container").height();
    $(".ketchup-error-container").css("top",offset.top-height+"px");
    if(autoCancle){
        clearTimeout(autoCancle);
    }
    var autoCancle = setTimeout(function(){
        cancleTip();
    },3000);
    return false;
}
//去除错误提示框方法
function cancleTip(){
    $(".ketchup-error-container").remove();
}
function sendSms(){
    if(checkMobile($phoneNum.val())){
        return showTip($phoneNum,checkMobile($phoneNum.val()));
    }
    var clock = '';
    var nums = 60;
    $("#getSms").attr("disabled","disabled");
    $("#getSms").text(nums+'s');
    var data = {"mobile" : $phoneNum.val()};
    $.ajax({
        type : "POST",
        url : basePath + "/sendMessage",
        async : true,
        data : data,
        dataType : "json",
        success : function(result){
        	clock = setInterval(doLoop, 1000);
        	console.log(result)
        }
    })
    
    function doLoop() {
        nums--;
        if(nums > 0){
            $("#getSms").text(nums+'s');
        }else{
            clearInterval(clock); //清除js定时器
            $("#getSms").attr("disabled",false);
            $("#getSms").text('再次发送');
            nums =60; //重置时间
        }
    }
}
$('#questionSubmit').click(function () {
    if(isNull($("#username").val())){
        return showTip($("#username"),"姓名不能为空")
    }
    if(checkEmail($("#email").val())){
        return showTip($("#email"),checkEmail($("#email").val()));
    }
    if(isNull($("#question").val())){
        return showTip($("#question"),"意见或建议不能为空")
    }
    $('#questionForm').submit();
})

$('#questionForm').ajaxForm(function(result) {
    if (result != null && result.msg == 'success'){
        tipWrap(1,"您已提交成功！")
        $('#questionForm')[0].reset();
    }else{
        tipWrap(0,"提交失败，请重试")
    }
});
function tipWrap(index,msg) {
    var url;
    if(index == 1 || index == 2){
        url = "static/img/zq.png";
    }else{
        url = "static/img/X.png";
    }
    var html = '<div class="tipWrap">\n' +
        '<div>\n' +
        '<img src='+url+' alt="">\n' +
        '<h3 class="text-center">'+msg+'</h3>\n' +
        '<button onclick="tipRemove('+index+')">关闭</button>\n' +
        '<button onclick="tipRemove('+index+')">确定</button>\n' +
        '</div>\n' +
        '</div>'
    $("body").append(html);
    $(".tipWrap").fadeIn(200);
}
function tipRemove(index) {
    if(index == 2){
        window.location.href="index";
        return;
    }
    $(".tipWrap").fadeOut(200,function () {
        $(".tipWrap").remove();
    });
}