/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.cart;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CartDetailDTO implements Serializable{

    public int IDcart, quanlity;
    public String IDproduct;

    public CartDetailDTO(int IDcart, int quanlity, String IDproduct) {
        this.IDcart = IDcart;
        this.quanlity = quanlity;
        this.IDproduct = IDproduct;
    }

    public int getIDcart() {
        return IDcart;
    }

    public void setIDcart(int IDcart) {
        this.IDcart = IDcart;
    }

    public int getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }

    public String getIDproduct() {
        return IDproduct;
    }

    public void setIDproduct(String IDproduct) {
        this.IDproduct = IDproduct;
    }

    @Override
    public String toString() {
        return "CartDetailDTO{" + "IDcart=" + IDcart + ", quanlity=" + quanlity + ", IDproduct=" + IDproduct + '}';
    }

}
