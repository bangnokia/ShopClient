<%-- 
    Document   : home
    Created on : Sep 19, 2016, 3:35:24 AM
    Author     : daudau
--%>
<%@include file="_header.jsp" %>
<!-- BEGIN CONTAINER -->
<%@include file="_sidebar.jsp" %>
<!-- BEGIN PAGE CONTAINER-->
<style>
    .search {
        margin-top: -25%;
    }
    .search .form-section{
        background:#f6f7f8;
        border-radius: 5px;
        padding: 10px;
    }
</style>  
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
    <div class="content sm-gutter" style="padding-top: 20px;">
        <div class="page-title">
            Manager product
        </div>
        <div class="col-md-6" style="width: 900px">
            <div class="grid simple" style="">
                <div class="grid-title no-border">
                    <h4><span class="semi-bold">Product manager</span></h4>
                    <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
                </div>
                <div class="grid-body no-border">
                    <div class="search" style="margin-top: auto">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="form-section">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="serchtile">Name</div>
                                            <input class="form-control" id="frm_search_name">
                                        </div>
                                        <div class="col-md-2">
                                            <div class="serchtile">Status</div>
                                            <select id="frm_search_status" class="form-control">
                                                <option value="">All</option>
                                                <option value="1">Approved</option>
                                                <option value="0">Processing</option>
                                            </select>  
                                        </div>
                                        <div class="col-md-2">
                                            <br>
                                            <button type="button" id="btnSearch" class="btn btn-default btn-primary">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                <button type="button" id="saveForm" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Approval</button>
                                <button type="button" id="hideForm" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Hide</button>
                                <button type="button" id="deleteFORM" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Delete</button>
                            </div>

                        </div>
                        <div id="gridProduct" style="margin-top: 40px">
                        </div> 
                        <div class="img-preview" style="float: left; margin-top: 10px; width: 30%">
                            <img src="" style="width:  100%" />
                        </div>
                        <div style="float: left;width: 70%;padding-left: 10px"> 
                            <label>Description</label> <br/>
                            <input type="hidden" id="frm_addproduct_description" name="description"/>
                            <textarea class="form-control" name="" style="height: 300px" id="textarea-description"></textarea>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="_footer.jsp" %>
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script src="${adminRoot}/assets/js/jsAdminProduct.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        tinymce.init({
            selector: 'textarea',
            readonly: true,
            fontsize_formats: "12pt 26pt 36pt",
            setup: function (ed) {
                ed.on('change', function (e) {
                    console.log('the event object ', e);
                    console.log('the editor object ', ed);
                    console.log('the content ', ed.getContent());
                    $('#frm_addproduct_description').val(ed.getContent());
                });
            }
        });
        urlForm = '${adminRoot}';
        product();
    });
</script>