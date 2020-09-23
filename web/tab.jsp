<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>用户列表数据</title>
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .my-body {
            padding: 5px;
        }

        .my-body .panel {
            margin-bottom: 5px;
        }

        .my-body .table {
            margin-bottom: 5px;
        }

        .my-nav {
            text-align: right;
            padding-right: 20px;
        }

        .my-nav .pagination {
            margin: 0;
        }
    </style>
</head>
<body>
<div class="my-body">
    <div class="panel panel-default">
        <div class="panel-heading">用户列表数据</div>
        <div class="panel-body">
            <form class="form-inline">
                <div class="form-group">
                    <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-folder-open" aria-hidden="true">
                        </div>
                        <input type="text" class="form-control" id="exampleInputAmount" placeholder="请输入信息">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索
                </button>
                <button type="button" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
                </button>
                <button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-minus" aria-hidden="true"></span> 删除
                </button>
            </form>
        </div>
    </div>

    <table class="table table-bordered table-hover table-condensed">
        <tr class="active">
            <td>姓名</td>
            <td>年龄</td>
            <td>密码</td>
        </tr>
        <tr v-for="da in list">
            <td>{{da.name}}</td>
            <td>{{da.age}}</td>
            <td>{{da.passwd}}</td>
        </tr>
    </table>
    <div class="my-nav">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a aria-label="Previous" v-on:click="upPage()">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li v-for="page in pageList">
                    <a v-on:click="getData(page)">{{page}}</a>
                </li>
                <li>
                    <a aria-label="Next" v-on:click="downPage()">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<script src="plugins/jq/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/vue/vue.js"></script>
<script>
    var app = new Vue({
        el: '.my-body',
        data: {
            nowPage: 1,
            maxSize: 1,
            list: [],
            pageList: []
        },
        methods: {
            upPage: function () {
                if (this.nowPage === 1) {
                    this.nowPage = 1;
                } else {
                    this.nowPage = this.nowPage - 1;
                    this.getData(this.nowPage);
                }
            },
            downPage: function () {
                var maxSize = this.maxSize;
                if (this.nowPage === maxSize) {
                    this.nowPage = maxSize;
                } else {
                    this.nowPage = this.nowPage + 1;
                    this.getData(this.nowPage);
                }
            },
            getData: function (indexPage) {
                $.ajax({
                    url: "/tab",
                    type: "POST",
                    data: {
                        index: indexPage
                    },
                    dataType: "JSON",
                    success: function (data) {
                        app.maxSize = data.maxSize;
                        app.pageList = [];
                        for (var i = 1; i <= data.maxSize; i++) {
                            app.pageList.push(i);
                        }
                        app.list = data.list;
                    },
                    error: function () {
                        alert("err");
                    }
                });
            }
        }
    });
    app.getData(1);
</script>
</body>
</html>
