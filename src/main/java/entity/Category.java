/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Hieu
 */
public class Category {

    private int idCat;
    private int parentID;
    private String name;
    private String icon;
    private String status;

    public Category(int idCat, int parentID, String name, String icon, String status) {
        this.idCat = idCat;
        this.parentID = parentID;
        this.name = name;
        this.icon = icon;
        this.status = status;
    }

    public Category() {
    }

    public int getIdCat() {
        return idCat;
    }

    public int getParentID() {
        return parentID;
    }

    public String getName() {
        return name;
    }

    public String getIcon() {
        return icon;
    }

    public String getStatus() {
        return status;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
