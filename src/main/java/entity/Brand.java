package entity;
// Generated Nov 1, 2016 7:38:18 PM by Hibernate Tools 4.3.1



/**
 * Brand generated by hbm2java
 */
public class Brand  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String status;

    public Brand() {
    }

    public Brand(String name, String status) {
       this.name = name;
       this.status = status;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}


