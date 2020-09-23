package org.spoto.servlet;

import com.alibaba.fastjson.JSONObject;
import org.spoto.service.LoginService;
import org.spoto.service.impl.LoginServiceImpl;
import org.spoto.utils.JsonUtils;
import org.spoto.utils.StringUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login.ajax")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收参数
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String user_type = request.getParameter("user_type");
        System.out.println("user_type"+"==="+user_type);
        //2.校验
        int code = 0;
        if (!StringUtils.isAllNotEmpty(name,pwd)){
            code = -1;
        }else {
            //3.调用业务处理
            LoginService ls = new LoginServiceImpl();
            boolean b = ls.doLogin(name, pwd, user_type);
            if (b){
                code = 0;
            }else {
                code = 1;
            }
        }
        //4.处理结果
        System.out.println("code"+"==="+code);
        JSONObject data = new JSONObject();
        data.put("code",code);
        JsonUtils.outJson(data,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}
