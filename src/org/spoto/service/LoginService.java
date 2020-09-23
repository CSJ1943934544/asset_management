package org.spoto.service;

public interface LoginService {
    /**
     * 登陆验证
     * @param name
     * @param pwd
     * @return
     */
    boolean doLogin(String name,String pwd,String user_type);
}
