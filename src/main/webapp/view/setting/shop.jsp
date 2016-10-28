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
                    <span class="page-heading-title2">Shop manage</span> 
                </h2>
                <!-- Content page -->
                <div class="content-text clearfix">
                    <div class="box-authentication">
                        <h2><span class="page-heading-title2" id="titleShop"></span></h2>

                        <form id="frm_addshop" class="product-form">
                            <input type="hidden" id="frm_addshop_id" name="id">
                            <input type="hidden" id="frm_addshop_userId" name="userId">
                            <label>Shop name</label>
                            <input id="frm_addshop_name" type="text" name="name" class="form-control" />
                            <label>Phone</label>
                            <input id="frm_addshop_phone" type="text" name="phone" class="form-control" />
                            <label>Email</label>
                            <input id="frm_addshop_email" type="text" name="email" class="form-control" />
                            <label>Address</label>
                            <input id="frm_addshop_address" type="text" name="address" class="form-control" />
                            <label>Status</label>
                            <select class="form-control" name="status" id="frm_addshop_status">
                                <option value="1">Show</option>
                                <option value="2">Hide</option>
                            </select>
                            <button type="button" id="saveForm" class="button btn-danger"><i class="fa fa-save"></i></button>
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
<script type="text/javascript" src="//api.filestackapi.com/filestack.js"></script>            
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script src="${root}/assets/js/jsShopManage.js" type="text/javascript"></script>
<%@ include file="../_partial/_footer.jsp" %>

<script>
    jQuery(document).ready(function () {
        shopmanage();
    });
</script>


