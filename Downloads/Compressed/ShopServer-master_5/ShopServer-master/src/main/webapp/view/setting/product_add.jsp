<%-- 
    Document   : profile
    Created on : Oct 17, 2016, 12:10:09 AM
    Author     : daudau
--%>

<%@ include file="../_partial/_header.jsp" %>

<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="#" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Setting</span>
        </div>
        <!-- ./breadcrumb -->
        <!-- row -->
        <div class="row"> 
            <%@ include file="sidebar.jsp" %>
            <!-- Center colunm-->
            <div class="center_column col-xs-12 col-sm-9" id="center_column">
                <!-- page heading-->
                <h2 class="page-heading">
                    <span class="page-heading-title2">Add new product</span>
                </h2>
                <!-- Content page -->
                <div class="content-text clearfix">
                    <div class="box-authentication">
                        <form action="" method="post">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" />
                            
                            <label>Price</label>
                            <input type="number" name="price" class="form-control" />
                            
                            <label>Category</label>
                            <select class="form-control" name="categoryId">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                            
                            <label>Brand</label>
                            <select class="form-control" name="brandId">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                        </form>
                    </div>
                </div>
                <!-- ./Content page -->
            </div>
            <!-- ./ Center colum -->
        </div>
        <!-- ./row-->
    </div>
</div>

<%@ include file="../_partial/_footer.jsp" %>