package org.spoto.utils;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class JsonUtils {

    /**
     * servlet输出json数据
     * @param data json数据
     * @param response HttpServletResponse
     * @throws IOException IO异常
     */
    public static void outJson(JSONObject data, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        writer.write(data.toJSONString());
        writer.flush();
    }

}
