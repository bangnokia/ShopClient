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
            ADD Brand 
        </div>
        <div class="col-md-6" style="width: 410px">
            <div class="grid simple" style="height: 500px">
                <div id="gridProduct">
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="grid simple" style="">
                <div class="grid-title no-border">
                    <h4>Icon <span class="semi-bold">Validation</span></h4>
                    <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
                </div>
                <div class="grid-body no-border"> <br>
                    <form id="form_product" method="post" name="" novalidate="novalidate">

                        <input type="text" name="id" id="form_product_id" disabled="disabled" class="form-control">                                 

                        <div class="form-actions">  
                            <div class="pull-right">
                                <button type="button" id="saveForm" value="" class="btn btn-white btn-cons"><i class="icon-ok"></i>browes</button>
                                <button type="button" id="deleteFORM" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>delete</button>
                            </div>
                        </div>
                    </form>
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