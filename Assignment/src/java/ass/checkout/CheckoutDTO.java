/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.checkout;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class CheckoutDTO {

    private String username, dateShip, dateOrder;
    private float totalPrice;
    boolean isPay;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDateShip() {
        return dateShip;
    }

    public void setDateShip(String dateShip) {
        this.dateShip = dateShip;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public boolean isIsPay() {
        return isPay;
    }

    public void setIsPay(boolean isPay) {
        this.isPay = isPay;
    }

    public CheckoutDTO(String username, String dateShip, String dateOrder, float totalPrice, boolean isPay) {
        this.username = username;
        this.dateShip = dateShip;
        this.dateOrder = dateOrder;
        this.totalPrice = totalPrice;
        this.isPay = isPay;
    }

    @Override
    public String toString() {
        return "CheckoutDTO{" + "username=" + username + ", dateShip=" + dateShip + ", dateOrder=" + dateOrder + ", totalPrice=" + totalPrice + ", isPay=" + isPay + '}';
    }

}
