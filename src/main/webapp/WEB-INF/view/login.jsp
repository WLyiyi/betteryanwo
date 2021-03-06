<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
		<link rel="stylesheet" href="../../statics/css/layui.css" media="all" />
		<link rel="stylesheet" href="../../statics/css/login.css" />
		<style>
			.cell-7{
				float: left;
				margin-bottom: 15px;
				margin-right: 5px;
			}
			.cell-7 input{
				width:105px;
				height: 40px;
				float: left;
				padding-left: 7px;

			}
			.cell-5{
				float: left;
				margin-bottom: 15px;
			}
		</style>

    </head>
	<body id="all" class="beg-login-bg" >
	<div class="beg-login-box">
		<div id="beg-login-box-one">
			<img src="/statics/images/15.png" />
			<div id="one-font">岛 尚 林 语</div>


		</div>
		<div class="beg-login-main">
			<form id="tab" action="/user/login" class="layui-form" method="post">
				<div class="layui-form-item">
					<label class="beg-login-icon">
						<i id="icon-user">&nbsp;&nbsp;&nbsp;&nbsp;</i>
					</label>
					<input type="text" name="email" lay-verify="email" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="beg-login-icon">
						<i id="icon-pwd">&nbsp;&nbsp;&nbsp;&nbsp;</i>
					</label>
					<input type="password" name="userPassword" lay-verify="userPassword" autocomplete="off" placeholder="这里输入密码" class="layui-input">
				</div>
				<div >
					<span class="cell-7">
                            <input type="text" id="verifyCode" name="verifycode" placeholder="请输入验证码" onclick="">
					</span>
					<span class="cell-5" style="text-align: center;">
                            <img id="captchaImg" src="/captcha/cpa" >
					</span>
				</div>
				<div class="layui-form-item">
					<!--<div class="beg-pull-left beg-login-remember">
                        <label>记住帐号？</label>
                        <input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">
                    </div>-->
					<div class="beg-pull-right">
						<button class="layui-btn layui-btn-primary" lay-submit lay-filter="login">
							<i><img src="/statics/images/icon-log.png" width="20" height="20"></i> 登录
						</button><br/><br/><br/>
						<a href="/user/toReg">还没账号？立即注册>></a>

					</div>0
					<div class="beg-clear"></div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="../../statics/js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="../../statics/plugins/layui/layui.js"></script>
	<script type="text/javascript">
/*		window.location.reload();*/
	</script>
	<script>

            layui.use(['form'], function(){
                var form = layui.form(),
                    $ = layui.jquery,
                    layer = layui.layer;


                //自定义验证规则

                form.verify({
                    email: function(value){
                        var regex = /^([\w-\.]+)@([\w-\.]+)(\.[a-zA-Z0-9]+)$/;
                        if(value.length==0){
                            return '请输入邮箱';
                        }else if (!value.match(regex)) {
                            return  '请输入有效的邮箱号！';
						}
                    }
                    ,userPassword: function(value){
                        var regex = /^[0-9A-Za-z]+$/;
                        if(value.length==0){
                            return '请输入密码';
                        }else if (!value.match(regex)) {
                            return  '密码输入错误';
                        }
                    }
                });
                //监听提交
                form.on('submit(login)', function(data){
                    /*layer.alert(JSON.stringify(data.field), {
                      title: '最终的提交信息'
                    });*/

                    var flag=-1;
                    $.post("/user/login",data.field,function(res){
                        console.log(res);
                        if(res.success){
                            flag=1;
                            sessionStorage.setItem("user",JSON.stringify(res.user));
                            location.href='/jump/toPcenter';
                        }else{
                            layer.alert(res.msg, {
                                title: '系统提示',
                            });
                        }
                    });
                    if(flag>0){
                        return true;
                    }else{
                        return false;
                    }
                });
            });
	</script>


 	</body>
</html>
