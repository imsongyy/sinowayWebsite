/**
 * Created by souyouyou on 2018/3/21.
 */

$(function () {
    $('form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: '用户名不能为空',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    }
                }
            },
            password: {
                message: '密码不能为空',
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            },
            gender: {
                message:'性别不能为空',
                validators: {
                    callback:{
                        callback: function(value, validator) {
                            if (value == -1){
                                return false;
                            }else {
                                return true;
                            }
                        }
                    }
                }
            }
        }
    });
});



