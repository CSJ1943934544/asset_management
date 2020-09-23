package org.spoto.service.impl;

import org.spoto.dao.LoginDao;
import org.spoto.dao.impl.LoginDaoImpl;
import org.spoto.service.LoginService;

public class LoginServiceImpl implements LoginService {
    @Override
    public boolean doLogin(String name, String pwd, String user_type) {
        LoginDao ld = new LoginDaoImpl();
        return ld.doLogin(name,pwd,user_type);
    }
}
