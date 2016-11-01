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
                        <input id="searchvalue" type="text" class="form-control" placeholder="input text here" />
                        <button type="button" id="Search" class="button btn-danger">Search</button>
                        <div class="grid simple" style="width: 450px">
                            <div id="gridProduct">
                            </div>
                        </div>
                        <form id="frm_addproduct" class="product-form">
                            <input type="hidden" id="frm_addproduct_quantity" name="quantity">
                            <input type="hidden" id="frm_addproduct_createdAt" name="createdAt">
                            <input type="hidden" id="frm_addproduct_outOfStock" name="outOfStock">
                            <input type="hidden" id="frm_addproduct_id" name="id">
                            <input type="hidden" id="frm_addproduct_shopId" name="shopId">
                            <input type="hidden" id="frm_addproduct_property" name="property">
                            
                            <label>Name</label>
                            <input id="frm_addproduct_name" type="text" name="name" class="form-control"  accesskey="REQ" />
                            <label>Image</label>
                            <input id="frm_addproduct_image" type="text" name="image" class="form-control" placeholder="Image" accesskey="REQ"/>
                            <label>Price</label>
                            <input id="frm_addproduct_price" type="text" name="price" class="form-control" accesskey="NUMBER" />
                            <label>Category</label>
                            <input id="frm_addproduct_categoryId" style="width: 50px" type="text" name="categoryId" class="form-control" accesskey="REQ"/>
                            <div class="form-control" id="dropDownButton">
                                <div style="border: none;" id='jqxTreeCategory'>
                                </div>
                            </div>
                            <label>Brand</label>
                            <select id="frm_addproduct_brandId" class="form-control" name="brandId" accesskey="REQ">
                            </select>
                            <label>status</label>
                            <select class="form-control" name="status" id="frm_addproduct_status">
                                <option value="1">Show</option>
                                <option value="2">Hide</option>
                                <option value="0">Stock out</option>
                            </select>
                            <label>Description</label> <br/>
                            <button class="button" type="button" id="description-img-upload">Upload Image</button>
                            <input type="hidden" id="frm_addproduct_description" name="description"/>
                            <textarea class="form-control" name="" id="textarea-description"></textarea>
                            <div class="img-preview">
                                <img src="" />
                            </div>
                            <button type="button" id="saveForm" class="button btn-danger"><i class="fa fa-save"></i>Save</button>   
                            <button type="button" id="clearForm" class="button" type="reset"><i class="fa fa-times"></i>Clear</button>
                            <button type="button" id="deleteForm" class="button" type="reset"><i class="fa fa-times"></i>Delete</button>
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
<script src="${root}/assets/js/jsAddProduct.js" type="text/javascript"></script>
<%@ include file="../_partial/_footer.jsp" %>

<script>
    tinymce.init({
        selector: 'textarea',
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
    jQuery(document).ready(function () {
        addproduct();
    });
</script>


