
<jsp:include page="_partial/_header.jsp" />
<style>
    .process-step .btn:focus{outline:none}
    .process{display:table;width:100%;position:relative}
    .process-row{display:table-row}
    .process-step button[disabled]{opacity:1 !important;filter: alpha(opacity=100) !important}
    .process-row:before{top:26px;bottom:0;position:absolute;content:" ";width:100%;height:2px;background-color:#ccc;z-order:0}
    .process-step{display:table-cell;text-align:center;position:relative;}
    .process-step p{margin-top:4px}
    .btn-circle{width:50px;height:50px;text-align:center;font-size:12px;border-radius:50%}
</style>
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="#" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Your shopping cart</span>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <!-- ../page heading-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <div class="container">
            <div class="row">
                <div class="process">
                    <div class="process-row nav nav-tabs">
                        <div class="process-step">
                            <button type="button" class="btn btn-info btn-circle" data-toggle="tab" href="#menu1"><i class="fa fa-info fa-2x"></i></button>
                            <p><small>01. Summary</small></p>
                        </div>
                        <div class="process-step">
                            <button type="button" class="btn btn-default btn-circle" data-toggle="tab" href="#menu3"><i class="fa fa-home fa-2x"></i></button>
                            <p><small>02. Address</small></p>
                        </div>
                        <!---
                        <div class="process-step">
                            <button type="button" class="btn btn-default btn-circle" data-toggle="tab" href="#menu4"><i class="fa fa-paper-plane-o fa-2x"></i></button>
                            <p><small>04. Shipping</small></p>
                        </div>
                        --->
                        <div class="process-step">
                            <button type="button" class="btn btn-default btn-circle" data-toggle="tab" href="#menu5"><i class="fa fa-credit-card fa-2x"></i></button>
                            <p><small>03. Payment</small></p>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    <div id="menu1" class="tab-pane fade active in">
                        <div class="heading-counter warning">Your shopping cart contains:
                            <span id="numberProductOrder">... Product</span>
                        </div>
                        <div class="order-detail-content">
                            <table class="table table-bordered table-responsive cart_summary">
                                <thead>
                                    <tr>
                                        <th class="cart_product">Product</th>
                                        <th>Description</th>
                                        <th>Avail.</th>
                                        <th>Unit price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th  class="action"><i class="fa fa-trash-o"></i></th>
                                    </tr>
                                </thead>
                                <tbody id="bodyItemProduct">
                                    <!--
                                    <tr>
                                        <td class="cart_product">
                                            <a href="#"><img src="assets/data/product-100x122.jpg" alt="Product"></a>
                                        </td>
                                        <td class="cart_description">
                                            <p class="product-name"><a href="#">Frederique Constant </a></p>
                                            <small class="cart_ref">SKU : #123654999</small><br>
                                            <small><a href="#">Color : Beige</a></small><br>   
                                            <small><a href="#">Size : S</a></small>
                                        </td>
                                        <td class="cart_avail"><span class="label label-success">In stock</span></td>
                                        <td class="price"><span>61,19 ?</span></td>
                                        <td class="qty">
                                            <input class="form-control input-sm" type="text" value="1">
                                            <a href="#"><i class="fa fa-caret-up"></i></a>
                                            <a href="#"><i class="fa fa-caret-down"></i></a>
                                        </td>
                                        <td class="price">
                                            <span>61,19 ?</span>
                                        </td>
                                        <td class="action">
                                            <a href="#">Delete item</a>
                                        </td>
                                    </tr>
                                    -->
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
                        <ul class="list-unstyled list-inline pull-right">
                            <li><button type="button" class="btn btn-danger" onclick="clearCart();">Clear</button></li>
                            <li><button type="button" class="btn btn-info next-step">Next<i class="fa fa-chevron-right" style="margin-top: 3px;"></i></button></li>
                        </ul>
                    </div>
                    <div id="menu3" class="tab-pane fade">
                        <form id="frm_order">
                            <input type="hidden" id="frm_order_id" name="id">
                            <input type="hidden" id="frm_order_userId" name="userId">
                            <input type="hidden" id="frm_order_status" name="status">
                            <input type="hidden" id="frm_order_product" name="product">
                            <input type="hidden" id="frm_order_type" name="type">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Name</label>
                                <input type="text" class="form-control" id="frm_order_name" name="name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email</label>
                                <input type="email" class="form-control" id="frm_order_email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Phone</label>
                                <input type="text" class="form-control" id="frm_order_phone" name="phone">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Shipping Address</label>
                                <input type="text" value="" class="form-control" id="frm_order_address" name="address" aria-describedby="emailHelp" placeholder="Address">
                                <small id="emailHelp" class="form-text text-muted">Address you will take your item.</small>
                            </div>

                        </form>
                        <ul class="list-unstyled list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step"><i class="fa fa-chevron-left" style="margin-top: 3px;"></i> Back</button></li>
                            <li><button type="button" class="btn btn-info next-step">Next <i class="fa fa-chevron-right" style="margin-top: 3px;"></i></button></li>
                        </ul>
                    </div>
                    <!---
                    <div id="menu4" class="tab-pane fade">

                        <ul class="list-unstyled list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step"><i class="fa fa-chevron-left" style="margin-top: 3px;"></i> Back</button></li>
                            <li><button type="button" class="btn btn-info next-step">Next <i class="fa fa-chevron-right" style="margin-top: 3px;"></i></button></li>
                        </ul>
                    </div>
                    --->
                    <div id="menu5" class="tab-pane fade">
                        <h2>Payment method</h2>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="type" id="frm_order_type" value="1" checked>
                                Cash on delivery
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="type" id="frm_order_type" value="2">
                                Cash on ATM
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="type" id="frm_order_type" value="3">
                                Cash on visa/credit card
                            </label>
                        </div>
                        <ul class="list-unstyled list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step"><i class="fa fa-chevron-left" style="margin-top: 3px;"></i> Back</button></li>
                            <li><button type="button" id="btnSaveOrder" class="btn btn-success"><i class="fa fa-check" style="margin-top: 3px;"></i> Done!</button></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./page wapper-->
<script type="text/javascript" src="//api.filestackapi.com/filestack.js"></script>            
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<jsp:include page="_partial/_footer.jsp" />
<script src="${root}/assets/js/jsOrder.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function () {
        Order();
    });
</script>
