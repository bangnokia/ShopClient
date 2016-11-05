<%-- 
    Document   : home
    Created on : Sep 19, 2016, 3:35:24 AM
    Author     : daudau
--%>
<%@include file="_header.jsp" %>
<!-- BEGIN CONTAINER -->
<%@include file="_sidebar.jsp" %>
<!-- BEGIN PAGE CONTAINER-->
<div class="page-content">
    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <div id="portlet-config" class="modal hide">
        <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"></button>
            <h3>Widget Settings</h3>
        </div>
        <div class="modal-body"> Widget settings form goes here </div>
    </div>
    <div class="clearfix"></div>
    <div class="content sm-gutter">
        <div class="page-title">
            Manager product
        </div>
        <div class="col-md-6" style="width: 900px">
            <div class="grid simple" style="">
                <div class="grid-title no-border">
                    <h4>Icon <span class="semi-bold">Validation</span></h4>
                    <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
                </div>
                <div class="grid-body no-border">

                    <form id="form_product" method="post" name="" novalidate="novalidate">
                        <input type="hidden" id="form_product_quantity" name="quantity">
                        <input type="hidden" id="form_product_createdAt" name="createdAt">
                        <input type="hidden" id="form_product_outOfStock" name="outOfStock">
                        <input type="hidden" id="form_product_id" name="id">
                        <input type="hidden" id="form_product_status" name="status">
                        <input type="hidden" id="form_product_shopId" name="shopId">
                        <input type="hidden" id="form_product_property" name="property">
                        <input type="hidden" id="form_product_name" name="name">
                        <input type="hidden" id="form_product_image" name="image">
                        <input type="hidden" id="form_product_price" name="price">
                        <input type="hidden" id="form_product_categoryId" name="categoryId">
                        <input type="hidden" id="form_product_brandId" name="brandId">
                        <input type="hidden" id="form_product_description" name="description">

                        <div class="form-actions">  
                            <div class="pull-left">
                                <button type="button" id="saveForm" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>browse</button>
                                <button type="button" id="hideForm" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>hide</button>
                                <button type="button" id="deleteFORM" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>delete</button>
                            </div>
                        </div>
                    </form>
                    <div class="col-md-6" style="width: 100%">
                        <div class="grid simple">
                            <div id="gridProduct">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="_footer.jsp" %>
<script src="${adminRoot}/assets/js/jsAdminProduct.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        urlForm = '${adminRoot}';
        product();
    });
</script>