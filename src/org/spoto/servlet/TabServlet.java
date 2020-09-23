package org.spoto.servlet;

import com.alibaba.fastjson.JSONObject;
import org.spoto.model.Tab;
import org.spoto.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/tab")
public class TabServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tab> list = getData("D:\\data\\user.txt");

        String indexStr = request.getParameter("index");
        // 第一页
        int index = Integer.parseInt(indexStr);
        // 一页几条数据
        int size = 5;

//        1-1~4，2-5~8，3-9~12，4-13~16

        // 最小值
        int min = (index - 1) * size;
        // 最大值
        int max = ((min + size) > list.size()) ? list.size() : (min + size);
        List<Tab> fd = new ArrayList<>();
        for (int i = min; i < max; i++) {
            fd.add(list.get(i));
        }

        JSONObject data = new JSONObject();
        data.put("list", fd);
        data.put("maxSize", (list.size() % size == 0) ? (list.size() / size) : (list.size() / size + 1) );
        JsonUtils.outJson(data, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
//        request.getRequestDispatcher("tab.jsp").forward(request, response);
    }

    public static List<Tab> getData(String path) {
        try {
            // 最终的数据
            List<Tab> dl = new ArrayList<>();

            // 读取文件
            FileReader fr1 = new FileReader(path);
            BufferedReader br1 = new BufferedReader(fr1);
            String line1 = "";
            while ((line1 = br1.readLine()) != null) {
                if (!"".equals(line1)) {
                    String[] arr = line1.split("-");
                    String name = arr[0];
                    String ageStr = arr[1];
                    Integer age = Integer.parseInt(ageStr);
                    String passwd = arr[2];
                    Tab tab = new Tab(name, age, passwd);
                    dl.add(tab);
                }
            }
            br1.close();
            fr1.close();
            return dl;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
