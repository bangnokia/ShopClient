/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import entity.User;

/**
 *
 * @author daudau
 */
public interface IUserDAO {
    
    public User findUser(String username);
    
    public boolean authenticateUser(User user);
}
