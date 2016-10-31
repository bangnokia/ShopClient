var catJson;
var jsonProduct;
var uesrIdform;
function productdetail() {
    var productId = $('#idProductDetail').val();
    uesrIdform = $('#dsaccsacsagsagsdwefe').val();
    var url = urlForm + '/product/create/getdetail?1=1&id=' + productId;
    var datajson = getDataJson(url);
    if (datajson == null)
        return;

    var url = urlForm + '/admin/category/getlistCAT?1=1';
    catJson = getDataJson(url);
    Stringsadsa = ',' + datajson[0].categoryId + ',';
    findCategoryChild(catJson, ',' + datajson[0].categoryId + ',');

    var url = urlForm + '/product/create/getlist?1=1&Text=&Price=&category=';
    jsonProduct = getDataJson(url);
    jsonProduct = addRateDataProduct(jsonProduct);

    datajson = addRateDataProduct(datajson);

    $('#product-detail').html(datajson[0].description);

    var status = ''
    if (datajson[0].status == '1')
        status = 'Available';
    else if (datajson[0].status == '2')
        status = '111111';
    else if (datajson[0].status == '0')
        status = 'Stock out';


    createReview();
    bindingProductListLeft();
    CreateRelatedProducts();
    createLinkProduct(datajson[0].categoryId, datajson[0].name);


    $('#product-imageDetail').html('<div class="product-full">' +
            '<img style="min-width: 100%;" id="product-zoom" src=\'' + datajson[0].image + '\' data-zoom-image="' + datajson[0].image + '"/>' +
            '</div>' +
            '<div class="product-img-thumb" id="gallery_01">' +
            '<ul class="owl-carousel" data-items="3" data-nav="true" data-dots="false" data-margin="20" data-loop="true">' +
            '<li>' +
            '<a href="#" data-image="' + datajson[0].image + '" data-zoom-image="' + datajson[0].image + '">' +
            '<img id="product-zoom"  src="' + datajson[0].image + '" /> ' +
            '</a>' +
            '</li>' +
            '<li>' +
            '<a href="#" data-image="' + datajson[0].image + '" data-zoom-image="' + datajson[0].image + '">' +
            '<img id="product-zoom"  src="' + datajson[0].image + '" /> ' +
            '</a>' +
            '</li>' +
            '</ul>' +
            '</div>');

    var url = urlForm + '/product/shop/getdetail?1=1&shopId=' + datajson[0].shopId;
    var jsonShop = getDataJson(url);

    $('#product_detai').html('<h1 class="product-name">' + datajson[0].name + '</h1>' +
            '<div class="product-comments">' +
            createRate(datajson[0]) +
            '</div>' +
            '<div class="comments-advices">' +
            '<a href="#">Based  on ' + numberOfRate(datajson[0]) + ' ratings</a>' +
            '<a href="#" id="rateProduct"><i class="fa fa-pencil"></i>rate product</a>' +
            '</div>' +
            '</div>' +
            '<div class="product-price-group">' +
            '<span class="price">' + formatNumberPrice(datajson[0].price, 'VND') + '</span>' +
            //  '<span class="old-price">$52.00</span>' +
            // '<span class="discount">-30%</span>' +
            '</div>' +
            '<div class="info-orther">' +
            '<p>Item Code: #' + datajson[0].id + '</p>' +
            '<p>Availability: <span class="in-stock">' + status + '</span></p>' +
            '<p>Condition: New</p>' +
            '</div>' +
            '<div class="product-desc"><h3 style="font-weight: bold;">Shop: ' + jsonShop[0].name + '</h3>' +
            'Phone: ' + jsonShop[0].phone +
            '</br>Address: ' + jsonShop[0].address +
            '</br>Email: ' + jsonShop[0].email +
            '</div>' +
            '<div class="form-option">' +
            '<p class="form-option-title">Available Options:</p>' +
            '<div class="attributes">' +
            '<div class="attribute-label">Color:</div>' +
            '<div class="attribute-list">' +
            '<ul class="list-color">' +
            '<li style="background:#0c3b90;"><a href="#">red</a></li>' +
            '<li style="background:#036c5d;" class="active"><a href="#">red</a></li>' +
            '<li style="background:#5f2363;"><a href="#">red</a></li>' +
            '<li style="background:#ffc000;"><a href="#">red</a></li>' +
            '<li style="background:#36a93c;"><a href="#">red</a></li>' +
            '<li style="background:#ff0000;"><a href="#">red</a></li>' +
            '</ul>' +
            '</div>' +
            '</div>' +
            '<div class="attributes">' +
            '<div class="attribute-label">Qty:</div>' +
            '<div class="attribute-list product-qty">' +
            '<div class="qty">' +
            '<input id="option-product-qty" type="text" value="1">' +
            '</div>' +
            '<div class="btn-plus">' +
            '<a href="#" class="btn-plus-up">' +
            '<i class="fa fa-caret-up"></i>' +
            '</a>' +
            '<a href="#" class="btn-plus-down">' +
            '<i class="fa fa-caret-down"></i>' +
            '</a>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '<div class="attributes">' +
            '<div class="attribute-label">Size:</div>' +
            '<div class="attribute-list">' +
            '<select>' +
            '<option value="1">X</option>' +
            '<option value="2">XL</option>' +
            '<option value="3">XXL</option>' +
            '</select>' +
            '<a id="size_chart" class="fancybox" href="assets/data/size-chart.jpg">Size Chart</a>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '<div class="form-action">' +
            '<div class="button-group">' +
            '<a class="btn-add-cart" href="#">Add to cart</a>' +
            '</div>' +
            '<div class="button-group">' +
            '<a class="wishlist" href="#"><i class="fa fa-heart-o"></i>' +
            '<br>Wishlist</a>' +
            '<a class="compare" href="#"><i class="fa fa-signal"></i>' +
            '<br>        ' +
            'Compare</a>' +
            '</div>' +
            '</div>' +
            '<div class="form-share">' +
            '<div class="sendtofriend-print">' +
            '<a href="javascript:print();"><i class="fa fa-print"></i> Print</a>' +
            '<a href="#"><i class="fa fa-envelope-o fa-fw"></i>Send to a friend</a>' +
            '</div>' +
            '<div class="network-share">' +
            '</div>' +
            '</div>');
    windowRate.init();
    bindingProductHome();
}

function getUserName(id) {
    var url = urlForm + '/product/create/getDetailUser?1=1&id=' + id;
    var datajson = getDataJson(url);
    return datajson;
}

function createReview() {
    var String = '';
    $.each(jsonRate, function (index) {
        var item = jsonRate[index];
        if (item.productId == $('#idProductDetail').val())
        {
            String += '<div class="comment row">' +
                    '<div class="col-sm-3 author">' +
                    '<div class="grade">' +
                    '<span>Grade</span>' +
                    createRate1(item.rate) +
                    '</div>' +
                    '<div class="info-author">' +
                    '<span><strong>' + getUserName(item.userId) + '</strong></span>' +
                    // '<em>04/08/2015</em>' +
                    '</div>' +
                    '</div>' +
                    '<div class="col-sm-9 commnet-dettail">' +
                    item.content +
                    '</div>' +
                    '</div>';
        }
    });
    $('#reviews-product').html(String);
}

function createLinkProduct(catId, NameProduct) {
    var nameCat = '';
    $.each(catJson, function (index) {
        var item = catJson[index];
        if (item.id == catId)
            nameCat = item.name;
    });
    $('#link-product').html('<a class="home" href="' + urlForm + '" title="Return to Home">Home</a>' +
            '<span class="navigation-pipe">&nbsp;</span>' +
            '<a href="' + urlForm + '/category/' + catId + '" title="Return to Home">' + nameCat + '</a>' +
            '<span class="navigation-pipe">&nbsp;</span>' +
            '<span class="navigation_page">' + NameProduct + '</span>');
}

function bindingProductListLeft() {
    var String = '<p class="title_block">NEW PRODUCTS</p>';
    $.each(jsonProduct, function (index) {
        var item = jsonProduct[index];
        if (Stringsadsa.indexOf(',' + item.categoryId + ',') != -1) {
            String += '<div class="block_content">' +
                    '<ul class="products-block best-sell">' +
                    '<li>' +
                    '<div class="products-block-left">' +
                    '<a href="' + urlForm + '/product/' + item.id + '">' +
                    '<img src="' + item.image + '" alt="SPECIAL PRODUCTS">' +
                    '</a>' +
                    '</div>' +
                    '<div class="products-block-right">' +
                    '<p class="product-name">' +
                    '<a href="#">' + item.name + '</a>' +
                    '</p>' +
                    '<p class="product-price">' + formatNumberPrice(item.price, 'VND') + '</p>' +
                    createRate(item) +
                    '</div>' +
                    '</li>' +
                    '</ul>' +
                    '</div>';
        }
    });

    $('#new-product-left').html(String);
}

function CreateRelatedProducts() {
    var String = '<h3 class="heading">Related Products</h3>' +
            '<ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive=\'{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}\'>';
    $.each(jsonProduct, function (index) {
        var item = jsonProduct[index];
        if (Stringsadsa.indexOf(',' + item.categoryId + ',') != -1) {
            String += '<li>' +
                    '<div class="left-block">' +
                    '<a href="' + urlForm + '/product/' + item.id + '">' +
                    '<img class="img-responsive" alt="product" src="' + item.image + '" /></a>' +
                    '<div class="quick-view">' +
                    '<a title="Add to my wishlist" class="heart" href="#"></a>' +
                    '<a title="Add to compare" class="compare" href="#"></a>' +
                    '<a title="Quick view" class="search" href="#"></a>' +
                    '</div>' +
                    '<div class="add-to-cart">' +
                    '<a title="Add to Cart" href="#">Add to Cart</a>' +
                    '</div>' +
                    '<div class="group-price">' +
                    // '<span class="product-new">NEW</span>' +
                    // '<span class="product-sale">Sale</span>' +
                    '</div>' +
                    '</div>' +
                    '<div class="right-block">' +
                    '<h5 class="product-name"><a href="#">' + item.name + '</a></h5>' +
                    '<div class="content_price">' +
                    '<span class="price product-price">' + formatNumberPrice(item.price, 'VND') + '</span>' +
                    //  '<span class="price old-price">' + formatNumberPrice(item.price, 'VND') + '</span>' +
                    '</div>' +
                    createRate(item) +
                    '</div>' +
                    '</div>' +
                    '</li>';
        }
    });
    String += ' </ul>';
    $('#Related-Products').html(String);
}

var windowRate = (function () {
    function _addEventListeners() {
        $('#rateProduct').bind('click', function () {
            $('#windowRate').jqxWindow('open');
        });

        $("#jqxRating").on('change', function (event) {
            $("#rate").find('span').remove();
            $("#rate").append('<span>' + event.value + '</span');

        });

        $('#sendRateProduct').bind('click', function () {
            var rate = $('#rate span').html();
            var content = $('#textarea-content').val();

            if (typeof uesrIdform == typeof undefined || uesrIdform == '') {
                alert('You need to login before!');
                return;
            }

            if (typeof rate == typeof undefined || rate == '') {
                alert('You need to rate product before!');
                return;
            }

            if (parseInt(rate) < 4 && content == '')
            {
                alert('You need to write a review!');
                $('#textarea-content').focus();
                return;
            }


            $('#form_rating_id').val($('#idProductDetail').val());
            $('#form_rating_userId').val(uesrIdform);
            $('#form_rating_rate').val(rate);
            $('#form_rating_content').val(content);

            do_save_form(urlForm + '/product/create/rating', 'form_rating', '');
        });
    }
    ;
    function _createElements() {

    }
    ;
    function _createWindow() {
        $('#windowRate').jqxWindow({
            showCollapseButton: false,
            maxHeight: 400,
            maxWidth: 700,
            minHeight: 200,
            theme: 'bootstrap',
            autoOpen: false,
            minWidth: 200,
            height: 300,
            width: 500,
            resizable: false,
            initContent: function () {
                $('#windowRate').jqxWindow('focus');
                $("#jqxRating").jqxRating({width: 350, height: 35, theme: 'classic'});
            }
        });
    }
    ;
    return {
        config: {
            dragArea: null
        },
        init: function () {
            //Creating all jqxWindgets except the window
            _createElements();
            //Attaching event listeners
            _addEventListeners();
            //Adding jqxWindow
            _createWindow();
        }
    };
}());
