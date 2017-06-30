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
            ADD Brand 
        </div>
        <div class="col-md-6" style="width: 340px">
            <div class="grid simple" style="height: 500px">
                <div id="gridBrand">
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="grid simple" style="">
                <div class="grid-title no-border">
                    <h4>Manage <span class="semi-bold">Brand</span></h4>
                </div>
                <div class="grid-body no-border"> <br>
                    <form id="form_brand" action="${adminRoot}/admin/brand/save" method="post" name="" novalidate="novalidate">
                        <div class="form-group hidden">
                            <label class="form-label">id brand</label>
                            <span class="help">id brand</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="id" id="form_brand_id" disabled="disabled" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">name</label>
                            <span class="help">Name of brand</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="name" id="form_brand_name" class="form-control" accesskey="REQ">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <span class="help">Show / hide</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <select name="status" id="form_brand_status">
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
<script src="${adminRoot}/assets/js/jsBrand.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        urlForm = '${adminRoot}';
        brand();
    });
</script>