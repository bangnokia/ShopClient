function jshome() {
    $('#SearchItem').bind('click', function () {
        loadingForm(true);
        setTimeout(function () {
            var url = urlForm + '/product/create/getlist?1=1&Text=' + $('#keywordSearch').val() + '&Price=&category=' + $('#categorySearch').val();
            var datajson = getDataJson(url);
            loadingForm(false);
            if (datajson == null)
                return;

            datajson = addRateDataProduct(datajson);
            datajson = sortItemJsonByRate(datajson, true, 'rate');

            bindingItemBest('tab-1', datajson);
            addCategoryProduct(datajson);

            bindingProductHome();
        }, 500);
    });

    $('#SearchItem').click();
}

function bindingItemBest(parentId, data) {
    var String = '  <ul  class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" ' +
            'data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true"' +
            'data-responsive=\'{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}\'>';
    $.each(data, function (index) {
        var item = data[index];
        ;
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
    });
    String += '</ul>'
    $('#' + parentId).html(String);
}

function addCategoryProduct(data) {
    var url = urlForm + '/admin/category/getlistCAT?1=1';
    var datajson = getDataJson(url);
    if (datajson == null)
        return;
    console.log(datajson);

    var String = '';
    var number = 0;
    $.each(datajson, function (index) {
        var item = datajson[index];
        if (item.parentId == 0) {
            number++;
            var bestItemImage = "";
            var bestItemId = "";

            Stringsadsa = ',' + item.id + ',';
            findCategoryChild(datajson, ',' + item.id + ',');

            var StringProduct = '  <ul  class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" ' +
                    'data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true"' +
                    'data-responsive=\'{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}\'>';
            $.each(data, function (index) {
                var item = data[index];
                if (Stringsadsa.indexOf(',' + item.categoryId + ',') != -1) {
                    if (bestItemImage == '') {
                        bestItemImage = item.image;
                        bestItemId = item.id;
                    }
                    StringProduct += '<li>' +
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
                            //  '<span class="product-new">NEW</span>' +
                            //'<span class="product-sale">Sale</span>' +
                            '</div>' +
                            '</div>' +
                            '<div class="right-block">' +
                            '<h5 class="product-name"><a href="#">' + item.name + '</a></h5>' +
                            '<div class="content_price">' +
                            '<span class="price product-price">' + formatNumberPrice(item.price, 'VND') + '</span>' +
                            // '<span class="price old-price">' + item.price + '</span>' +
                            '</div>' +
                            createRate(item) +
                            '</div>' +
                            '</div>' +
                            '</li>';
                }
            });
            StringProduct += '</ul>'

            String += '<div class="category-featured">' +
                    '<nav class="navbar nav-menu nav-menu-red show-brand">' +
                    '<div class="container">' +
                    '<!-- Brand and toggle get grouped for better mobile display -->' +
                    '<div class="navbar-brand"><a href="' + urlForm + /category/ + item.id + '"><img alt="' + item.name + '" src="' + item.icon + '" />' + item.name + '</a></div>' +
                    '<span class="toggle-menu"></span>' +
                    '<!-- Collect the nav links, forms, and other content for toggling -->' +
                    '<div class="collapse navbar-collapse">' +
                    '<ul class="nav navbar-nav">' +
                    '<li class="active"><a data-toggle="tab" href="#tab-4">Best Seller</a></li>' +
                    '<li><a href="#">Women</a></li>' +
                    '<li><a href="#">Men</a></li>' +
                    '<li><a href="#">Kids</a></li>' +
                    '<li><a href="#">Accessories</a></li>' +
                    '</ul>' +
                    '</div><!-- /.navbar-collapse -->' +
                    '</div><!-- /.container-fluid -->' +
                    '<div id="elevator-' + number + '" class="floor-elevator">' +
                    '<a href="#elevator-' + (number - 1) + '" class="btn-elevator up fa fa-angle-up"></a>' +
                    '<a href="#elevator-' + (number + 1) + '" class="btn-elevator down fa fa-angle-down"></a>' +
                    '</div>' +
                    '</nav>' +
//                    '<div class="category-banner">' +
//                    '<div class="col-sm-6 banner">' +
//                    '<a href="#"><img alt="ads2" class="img-responsive" src="' + urlForm + '/assets/data/ads6.jpg" /></a>' +
//                    '</div>' +
//                    '<div class="col-sm-6 banner">' +
//                    '<a href="#"><img alt="ads2" class="img-responsive" src="' + urlForm + '/assets/data/ads7.jpg" /></a>' +
//                    '</div>' +
//                    '</div>' +
                    '<div class="product-featured clearfix">' +
                    '<div class="banner-featured">' +
                    '<div class="featured-text"><span>featured</span></div>' +
                    '<div class="banner-img">' +
                    '<a href="' + urlForm + '/product/' + bestItemId + '"><img style="min-height: 350px; min-width: 234px;max-height: 350px; max-width: 234px; " alt="Featurered 1" src="' + bestItemImage + '" /></a>' +
                    '</div>' +
                    '</div>' +
                    '<div class="product-featured-content">' +
                    '<div class="product-featured-list">' +
                    '<div class="tab-container">' +
                    '<!-- tab product -->' +
                    '<div class="tab-panel active" id="tab-4">' +
                    StringProduct +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
        }
    });

    $('#containerHome').html(String);
}
