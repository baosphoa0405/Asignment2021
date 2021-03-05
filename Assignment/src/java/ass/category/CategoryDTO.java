/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.category;

/**
 *
 * @author Acer
 */
public class CategoryDTO {
    private String IDcategory;
    private String categoryName;
    public CategoryDTO(String IDcategory, String categoryName) {
        this.IDcategory = IDcategory;
        this.categoryName = categoryName;
    }

    public String getIDcategory() {
        return IDcategory;
    }

    public void setIDcategory(String IDcategory) {
        this.IDcategory = IDcategory;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "IDcategory=" + IDcategory + ", categoryName=" + categoryName + '}';
    }
    
}
