/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.user;

import java.io.Serializable;


public class UserDTO implements Serializable{
    private String username,name,password;
    private boolean role;

    public UserDTO() {
    }

    public UserDTO(String username, String name, String password, boolean role) {
        this.username = username;
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "username=" + username + ", name=" + name + ", password=" + password + ", role=" + role + '}';
    }
    
}
