var app =new Vue({
    el:'.login',
    data: {
        name: '',
        pwd: '',
        user_type:'1'
    },
    methods: {
        doLogin: function () {
            var name = this.name;
            var pwd = this.pwd;
            var user_type = this.user_type;
            if (name === ""){
                alert("账号不能为空！");
                return;
            }
            if (pwd === ""){
                alert("密码不能为空！");
                return;
            }
            $.ajax({
                url: "/login.ajax",
                type: "POST",
                data: {
                    name : name,
                    pwd : pwd,
                    user_type : user_type
                },
                dataType:"JSON",
                success: function (resp) {
                    if (resp.code === 0){
                        if (user_type == 1){
                            alert("登录成功！");
                            //window.location.href="/";
                        }else if (user_type == 0){
                            alert("登录成功！欢迎您管理员！");
                            window.location.href="main.jsp";
                        }
                        //window.location.href="/";
                    }else {
                        alert("用户名或密码错误！");
                    }
                },
                error: function () {
                        alert("服务器错误，请联系管理员！");
                }
            })
        }
    }
})