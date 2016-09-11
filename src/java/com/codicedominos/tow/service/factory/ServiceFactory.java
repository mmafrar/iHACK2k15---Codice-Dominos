<<<<<<< HEAD
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.codicedominos.tow.service.factory;


import com.codicedominos.tow.service.Service;
import com.codicedominos.tow.service.impl.UserServiceImpl;
import java.sql.SQLException;

/**
 *
 * @author Mannu
 */
public class ServiceFactory {
     public static Service getService(String name) throws SQLException,ClassNotFoundException{
        if(name.equals("UserService")){
            return new UserServiceImpl();
        }else{
            return null;
        }
    }
}
=======
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.codicedominos.tow.service.factory;


import com.codicedominos.tow.service.Service;
import com.codicedominos.tow.service.impl.UserServiceImpl;
import java.sql.SQLException;

/**
 *
 * @author Mannu
 */
public class ServiceFactory {
     public static Service getService(String name) throws SQLException,ClassNotFoundException{
        if(name.equals("UserService")){
            return new UserServiceImpl();
        }else{
            return null;
        }
    }
}
>>>>>>> b592174b925c384ece0f31f55557df5f7d33b354
