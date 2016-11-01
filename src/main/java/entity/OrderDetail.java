package entity;
// Generated Nov 1, 2016 7:38:18 PM by Hibernate Tools 4.3.1



/**
 * OrderDetail generated by hbm2java
 */
public class OrderDetail  implements java.io.Serializable {


     private Integer id;
     private Integer orderId;
     private Integer productId;
     private Float price;

    public OrderDetail() {
    }

    public OrderDetail(Integer orderId, Integer productId, Float price) {
       this.orderId = orderId;
       this.productId = productId;
       this.price = price;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }
    public Float getPrice() {
        return this.price;
    }
    
    public void setPrice(Float price) {
        this.price = price;
    }




}


