<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>资产管理系统</title>
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <style>
    </style>
</head>
<body>
<div class="main">
    <div>
        <nav class="navbar navbar-default my-nav">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1"
                            aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">管理系统</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">
                                欢迎您 ${name} <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">修改资料</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a onclick="outLogin()">退出登录</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>

    <div>
        <div>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                               aria-expanded="true"
                               aria-controls="collapseOne">
                                资产系统管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                         aria-labelledby="headingOne">
                        <div class="panel-body">
                            <a url="tab01.html" class="btn btn-link btn-block mybtn" role="button">用户信息管理</a>
                            <a url="login.html" class="btn btn-link btn-block mybtn" role="button">系统查看</a>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo"
                               aria-expanded="false" aria-controls="collapseTwo">
                                用户管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            待开发中。。。
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree"
                               aria-expanded="false" aria-controls="collapseThree">
                                数据分析
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                         aria-labelledby="headingThree">
                        <div class="panel-body">
                            待开发中。。。
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <iframe id="myif" src="tab.jsp" border="0" frameborder="0" width="100%" height="100%"></iframe>
        </div>
    </div>
    <div>
        CopyRight© 2020版权所有 闽ICP备xxxxx号
    </div>
</div>
    <script src="plugins/jq/jquery.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/vue/vue.js"></script>
    <script src="js/main.js"></script>
    <script>
    $(".mybtn").bind("click", function () {
        var url = $(this).attr("url");
        $("#myif").attr("src", url);
    });

    function outLogin() {
        $.ajax({
            url: "/out-login",
            type: "POST",
            dataType: "JSON",
            success: function (data) {
                if (data.type) {
                    alert("退出成功");
                    window.location.href = "login.html";
                } else {
                    alert("系统异常");
                }
            },
            error: function () {
                alert("err");
            }
        });
    }
    </script>
</body>
</html>

