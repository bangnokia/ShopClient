package entity;
// Generated Oct 10, 2016 5:51:38 PM by Hibernate Tools 4.3.1



/**
 * Productpropertydetail generated by hbm2java
 */
public class Productpropertydetail  implements java.io.Serializable {


     private ProductpropertydetailId id;
     private String value;
     private String status;

    public Productpropertydetail() {
    }

	
    public Productpropertydetail(ProductpropertydetailId id) {
        this.id = id;
    }
    public Productpropertydetail(ProductpropertydetailId id, String value, String status) {
       this.id = id;
       this.value = value;
       this.status = status;
    }
   
    public ProductpropertydetailId getId() {
        return this.id;
    }
    
    public void setId(ProductpropertydetailId id) {
        this.id = id;
    }
    public String getValue() {
        return this.value;
    }
    
    public void setValue(String value) {
        this.value = value;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}

