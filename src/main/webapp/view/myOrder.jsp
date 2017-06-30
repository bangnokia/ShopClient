
<jsp:include page="_partial/_header.jsp" />
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
            <%@ include file="setting/sidebar.jsp" %>
            <!-- Center colunm-->
            <div class="center_column col-xs-12 col-sm-9" id="center_column">
                <!-- page heading-->
                <h2 class="page-heading">
                    <span class="page-heading-title2">List Order</span> 
                </h2>
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
                                <option value="1">Unfinished</option>
                                <option value="2">Shipping</option>
                                <option value="0">Done</option>
                            </select>  
                        </div>
                        <div class="col-md-2">
                            <br>
                            <button type="button" id="btnSearch" class="btn btn-default btn-primary">Search</button>
                        </div>
                    </div>
                </div>
                <!-- Content page -->
                <div class="content-text clearfix">
                    <div class="container">
                        <div class="row" style="width: 80%">
                            <div class="table-responsive">
                                <table id="mytable" class="table table-bordred table-striped">
                                    <thead>
                                    <th></th>
                                    <th>Date</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th style="text-align: center;">Status</th>
                                    <th style="text-align: center;">Detail</th>
                                    <th style="text-align: center;">Delete</th>
                                    </thead>
                                    <tbody id="table_orderList">
                                        <!---
                                        <tr>
                                            <td><input type="checkbox" class="checkthis" /></td>
                                            <td>Mohsin</td>
                                            <td>Mohsin</td>
                                            <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
                                            <td>isometric.mohsin@gmail.com</td>
                                            <td>+923335586757</td>
                                            <td style="color: green">Done</td>
                                            <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil" style="padding-top: 2px;"></span></button></p></td>
                                            <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash" style="padding-top: 2px;"></span></button></p></td>
                                        </tr>
                                        --->
                                    </tbody>
                                </table>
                                <div class="clearfix"></div>
                                <ul class="pagination pull-right">
                                    <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                    <li class="active" id="ccc_page_1"><a href="#" onclick="getListOrder(1);">1</a></li>
                                    <li id="ccc_page_2"><a href="#"onclick="getListOrder(2);">2</a></li>
                                    <li id="ccc_page_3"><a href="#"onclick="getListOrder(3);">3</a></li>
                                    <li id="ccc_page_4"><a href="#"onclick="getListOrder(4);">4</a></li>
                                    <li id="ccc_page_5"><a href="#"onclick="getListOrder(5);">5</a></li>
                                    <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ./Content page -->
            </div>
            <!-- ./ Center colum -->
        </div>
        <!-- ./row-->
    </div>
</div>               


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog" style="width: 70%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Your Detail Order</h4>
            </div>
            <div class="modal-body">
                <span id="numberProductOrder">... Product</span>
                <table class="table table-bordered table-responsive cart_summary">
                    <thead>
                        <tr>
                            <th class="cart_product">Product</th>
                            <th>Description</th>
                            <th>Avail.</th>
                            <th>Unit price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody id="bodyItemProduct">
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2" rowspan="2"></td>
                            <td colspan="3">Total products (tax incl.)</td>
                            <td colspan="2" class="totalPriceOrder">0</td>
                        </tr>
                        <tr>
                            <td colspan="3"><strong>Total</strong></td>
                            <td colspan="2" class="totalPriceOrder"><strong>0</strong></td>
                        </tr>
                    </tfoot>    
                </table>
            </div>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>

<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
            </div>
            <div class="modal-body">

                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this order?</div>

            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-success" data-dismiss="modal" id="btnDeleteOrder" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
            </div>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>
<!-- ./page wapper-->
<jsp:include page="_partial/_footer.jsp" />
<script src="${root}/assets/js/jsMyOrder.js" type="text/javascript"></script>
<script>
                                        jQuery(document).ready(function () {
                                            MyOrder();
                                        });
</script>
