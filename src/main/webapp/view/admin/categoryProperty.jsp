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
    <div class="content sm-gutter" style="padding-top: 20px;">
        <div class="page-title">
            ADD category property
        </div>
        <div class="col-md-6" style="width: 440px">
            <div class="grid simple" style="height: 500px">
                <div id="gridBrand">
                </div>
            </div>
        </div>
        <div class="col-md-6" style="width: 450px">
            <div class="grid simple" style="">
                <div class="grid-title no-border">
                    <h4>Manage <span class="semi-bold">Category propety</span></h4>
                </div>
                <div class="grid-body no-border"> <br>
                    <form id="form_categoryproperty" action="${adminRoot}/admin/categoryproperty/save" method="post" name="" novalidate="novalidate">
                        <div class="form-group" style="display: none">
                            <label class="form-label">id categoryproperty</label>
                            <span class="help">id categoryproperty</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="id" id="form_categoryproperty_id" disabled="disabled" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Category</label>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <select name="catId" id="form_categoryproperty_catId">
                                </select>                             
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">name</label>
                            <span class="help">Name of categoryproperty</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="name" id="form_categoryproperty_name" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <span class="help">Show / hide</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <select name="status" id="form_categoryproperty_status">
                                    <option value="1">Show</option>
                                    <option value="2">Hide</option>
                                </select>
                            </div>
                        </div>                
                        <div class="form-actions">  
                            <div class="pull-right">
                                <button type="button" id="clearForm" class="btn btn-white btn-cons"><i class="icon-ok"></i>Clear</button>
                                <button type="button" id="saveForm" value="" class="btn btn-white btn-cons"><i class="icon-ok"></i>Save</button>
                                <button type="button" id="deleteFORM" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>delete</button>
                                <button type="button" class="btn btn-white btn-cons">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="_footer.jsp" %>
<script src="${adminRoot}/assets/js/jsCategoryProperty.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        urlForm = '${adminRoot}';
        categoryproperty();
    });
</script>