/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.product;

import java.io.Serializable;

/**
 *
 * @author Acer
 */
public class ProductDTO implements Serializable{
    private String IDproduct;
    private String name;
    private String size;
    private String img;
    private String description;
    private String IDcategory;
    private float price;
    private boolean status;

    public ProductDTO(String IDproduct, String name, String img, String size, String description, String IDcategory, float price, boolean status) {
        this.IDproduct = IDproduct;
        this.name = name;
        this.img = img;
        this.size = size;
        this.description = description;
        this.IDcategory = IDcategory;
        this.price = price;
        this.status = status;
    }

    public String getIDproduct() {
        return IDproduct;
    }

    public void setIDproduct(String IDproduct) {
        this.IDproduct = IDproduct;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIDcategory() {
        return IDcategory;
    }

    public void setIDcategory(String IDcategory) {
        this.IDcategory = IDcategory;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "IDproduct=" + IDproduct + ", name=" + name + ", img=" + img + ", size=" + size + ", description=" + description + ", IDcategory=" + IDcategory + ", price=" + price + ", status=" + status + '}';
    }
    
}
