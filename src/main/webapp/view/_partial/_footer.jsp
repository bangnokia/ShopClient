<%-- 
    Document   : _footer
    Created on : Sep 17, 2016, 4:21:21 PM
    Author     : daudau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer id="footer">
    <div class="container">
        <!-- introduce-box -->
        <div id="introduce-box" class="row">
            <div class="col-md-3">
                <div id="address-box">
                    <a href="#"><img src="${root}/assets/data/introduce-logo.png" alt="" /></a>
                    <div id="address-list">
                        <div class="tit-name">Address:</div>
                        <div class="tit-contain">19 Nguyen Trai, Thanh Xuan, Ha Noi.</div>
                        <div class="tit-name">Phone:</div>
                        <div class="tit-contain">0904 527 144</div>
                        <div class="tit-name">Email:</div>
                        <div class="tit-contain">support@devkafe.com</div>
                    </div>
                </div> 
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="introduce-title">Company</div>
                        <ul id="introduce-company"  class="introduce-list">
                            <li><a href="#">About Us</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4">
                        <div class="introduce-title">My Account</div>
                        <ul id = "introduce-Account" class="introduce-list">
                            <li><a href="${root}/myorder">My Order</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4">
                        <div class="introduce-title">Support</div>
                        <ul id = "introduce-support"  class="introduce-list">
                            <li><a href="#">About Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div id="contact-box">
                    <div class="introduce-title">Newsletter</div>
                    <div class="input-group" id="mail-box">
                        <input type="text" placeholder="Your Email Address"/>
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">OK</button>
                        </span>
                    </div>
                    <div class="introduce-title">Let's Socialize</div>
                    <div class="social-link">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                    </div>
                </div>
            </div>
        </div><!-- /#introduce-box -->
        <!-- #trademark-box -->

        <!-- /#trademark-text-box --> 
        <div id="footer-menu-box">
            <p class="text-center">Copyrights &#169; 2016 hna shop. All Rights Reserved. Designed by hna shop</p>
        </div><!-- /#footer-menu-box -->
    </div> 
</footer>
<div id="div_loadingContent" style="width: 100%;z-index: 999999; display: none; text-align: center;position: fixed;top: 0px;height: 100%;left: 0px;background-color: rgba(0, 0, 0, 0.18);">
    <div id="loadingContent" class="cssload-container">            
        <div class="cssload-loader">
            <div class="cssload-inner cssload-one"></div>
            <div class="cssload-inner cssload-two"></div>
            <div class="cssload-inner cssload-three"></div>
        </div>
    </div>
</div>

<div id="windowRate" style="display: none">
    <div id="windowRateHeader">
        <span>
            <img src="" alt="" style="margin-right: 15px" />Rate
        </span>
    </div>
    <div style="overflow: hidden;" id="windowRateContent">
        <form id="form_rating">
            <input type="hidden" id="form_rating_userId" name="userId"/>
            <input type="hidden" id="form_rating_rate" name="rate"/>
            <input type="hidden" id="form_rating_content" name="content"/>
            <input type="hidden" id="form_rating_id" name="id"/>
        </form>
        <div style='float: left;'><h4>Rating:</h4></div><div id='jqxRating'></div>
        <div style="display: none">
            <div style='float: left;' id='rate'></div>
        </div>
        <label>Write a review</label>
        <textarea style="resize: none;height: 150px;" class="form-control" name="" id="textarea-content"></textarea>

        <div id="mail-box" class="button-group" style="margin-top: 5px"><button type="button" class="btn btn-default" id="sendRateProduct" >Send</button></div>
    </div>
</div>    

<div id="div_message_notification">
    <div id="messageNotification"></div>
</div>
<div id="containerNotification" style="position: fixed; z-index: 99999; top: 10px; right: 20px; overflow: auto;">
</div>          

<a href="#" class="scroll_top" title="Scroll to Top" style="display: inline;">Scroll</a>
<!-- Script-->
<script type="text/javascript" src="${root}/assets/lib/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${root}/assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}/assets/lib/select2/js/select2.min.js"></script>
<script type="text/javascript" src="${root}/assets/lib/jquery.bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${root}/assets/lib/owl.carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="${root}/assets/lib/jquery.countdown/jquery.countdown.min.js"></script>
<script type="text/javascript" src="${root}/assets/lib/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="${root}/assets/js/jquery.actual.min.js"></script>
<script type="text/javascript" src="${root}/assets/js/theme-script.js"></script>

<script src="${root}/assets/js/demos.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxcore.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxdata.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxbuttons.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxscrollbar.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxdropdownbutton.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxpanel.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxwindow.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxtree.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxrating.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxnotification.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxmenu.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxdropdownlist.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxlistbox.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxcheckbox.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxgrid.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxgrid.filter.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxcalendar.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxdatetimeinput.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxgrid.sort.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxgrid.pager.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxgrid.selection.js" type="text/javascript"></script>
<script src="${root}/assets/js/jqwidgets/jqxgrid.edit.js" type="text/javascript"></script>

<script src="${root}/assets/js/jquery.common.js" type="text/javascript"></script>

<script type="text/javascript">
    var urlForm = '${root}';
    var jsonRate;
    var jsonCartOrder;
    $(document).ready(function () {
        var url = urlForm + '/product/create/getlistrate?1=1&id=';
        jsonRate = getDataJson(url);
        console.log(jsonRate);

        var urlCategory = urlForm + '/admin/category/getlistCAT?1=1';
        var datajsonCategory = getDataJson(urlCategory);

        bindingcombo('categorySearch', '', datajsonCategory, 'id,name');
        bindingProductHome();
        addCartProduct();

        var url = urlForm + '/product/shop/getlist?1=1&userId=' + $('#dsaccsacsagsagsdwefe').val();
        var datajson = getDataJson(url, false);
        if (datajson == null) {
            $('.btnShopOrder').hide();
            $('.btnManageProduct').hide();
        } else {
            $('.btnShopOrder').show();
            $('.btnManageProduct').show();
        }
    });

    function clearCart() {
        jsonCartOrder = getDataJson(urlForm + '/auth/clearCart', '', '');
        window.location.href = urlForm;
    }

    function deleteCart(id) {
        jsonCartOrder = getDataJson(urlForm + '/auth/deleteCart?1=1&id=' + id, '', '');
        loadCart(jsonCartOrder);

    }

    function addCartProduct(myID) {
        var id;
        if (typeof myID != typeof undefined && myID != null) {
            id = $(myID).attr('accesskey');
            showNotification('success', 'Add successful!');
        } else {
            id = 0;
        }
        if (isNaN(id)) {
            alert('Loi truyen id!');
        }

        jsonCartOrder = getDataJson(urlForm + '/auth/insertCart?1=1&id=' + id, '', '');
        loadCart(jsonCartOrder);
    }

    function loadCart(jsonCartOrder) {
        var string = '';
        var numberitem = 0;
        var totalprice = 0;
        if (jsonCartOrder != null) {
            $.each(jsonCartOrder, function (index) {
                var item = jsonCartOrder[index];
                numberitem++;
                totalprice += item.price;
                string += '<ul>' +
                        '<li class="product-info">' +
                        '<a href="#" onclick="deleteCart(' + item.id + ')" class="remove_link" style="float: right; width: 20px; height: 20px;">X</a>' +
                        '<div class="p-left">' +
                        '<a href="#">' +
                        '<img width="100" height="150" src="' + item.image + '" alt="p10">' +
                        '</a>' +
                        '</div>' +
                        '<div class="p-right">' +
                        '<p class="p-name">' + item.name + '</p>' +
                        '<p class="p-rice">' + formatNumberPrice(item.price, 'VND') + '</p>' +
                        '</div>' +
                        '</li>' +
                        '</ul>';
            });
        }

        $('#cart-block').html('<a class="cart-link" href="' + urlForm + '/order">' +
                '<span class="title">Shopping cart</span>' +
                '<span class="total">' + formatNumberPrice(totalprice, 'VND') + '</span>' +
                '<span class="notify notify-left">' + numberitem + '</span>' +
                '</a>' +
                '<div class="cart-block">' +
                '<div class="cart-block-content">' +
                '<h5 class="cart-title">' + numberitem + ' Items in my cart</h5>' +
                '<div class="cart-block-list">' +
                string +
                '</div>' +
                '<div class="toal-cart">' +
                '<span>Total</span>' +
                '<span class="toal-price pull-right">' + formatNumberPrice(totalprice, 'VND') + '</span>' +
                '</div>' +
                '<div class="cart-buttons">' +
                '<a href="' + urlForm + '/order" class="btn-check-out">Checkout</a>' +
                '</div>' +
                '</div>' +
                '</div>');
    }
</script>

</body>
</html>