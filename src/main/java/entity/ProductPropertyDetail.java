package entity;
// Generated Oct 28, 2016 9:29:03 AM by Hibernate Tools 4.3.1



/**
 * Productpropertydetail generated by hbm2java
 */
public class ProductPropertyDetail  implements java.io.Serializable {


     private ProductPropertyDetailId id;
     private String value;
     private String status;

    public ProductPropertyDetail() {
    }

	
    public ProductPropertyDetail(ProductPropertyDetailId id) {
        this.id = id;
    }
    public ProductPropertyDetail(ProductPropertyDetailId id, String value, String status) {
       this.id = id;
       this.value = value;
       this.status = status;
    }
   
    public ProductPropertyDetailId getId() {
        return this.id;
    }
    
    public void setId(ProductPropertyDetailId id) {
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


