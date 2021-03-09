/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.user;


public class UserDTO {
    private String IDuser,name,password,email;
    private int age;
    private boolean role;

    public UserDTO(String IDuser, String name, String password, String email, int age, boolean role) {
        this.IDuser = IDuser;
        this.name = name;
        this.password = password;
        this.email = email;
        this.age = age;
        this.role = role;
    }

    public String getIDuser() {
        return IDuser;
    }

    public void setIDuser(String IDuser) {
        this.IDuser = IDuser;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }
    
    @Override
    public String toString() {
        return "ProductDTO{" + "IDuser=" + IDuser + ", name=" + name + ", password=" + password + ", email=" + email + ", age=" + age + ", role=" + role + '}';
    }
    
}
