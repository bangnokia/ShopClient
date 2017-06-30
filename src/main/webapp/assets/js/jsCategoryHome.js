var catJson;
var arrBrand = [];
var arrCat = [];
var jsonProduct;

function CategoryHome() {
    var categoryId = $('#idCategoryDetail').val();

    var url = urlForm + '/product/create/getlist?1=1&outofstock=1&Text=&Price=&category=&shopId=&status=1';
    jsonProduct = getDataJson(url);

    var url = urlForm + '/admin/category/getlistCAT?1=1';
    catJson = getDataJson(url);
    Stringsadsa = ',' + categoryId + ',';
    findCategoryChild(catJson, ',' + categoryId + ',');

    createLinkCat(categoryId);
    createBrand();
    createCategoryFilter();

    $('#SearchItem').click(function () {
        loadingProduct();
        showNotification('success', 'ok');
    });

    $('.brand_Checkbox').click(function () {
        arrBrand = [];
        $('.brand_Checkbox:checked').each(function (i) {
            arrBrand[i] = $(this).val();
        });
        loadingProduct();
        showNotification('success', 'ok');
    });

    $('.cat_Checkbox').click(function () {
        arrCat = [];
        $('.cat_Checkbox:checked').each(function (i) {
            arrCat[i] = $(this).val();
        });
        loadingProduct();
        showNotification('success', 'ok');
    });

    $('#sort-product-category,#keywordSearch').bind('change', function () {
        loadingProduct();
        showNotification('success', 'ok');
    });

    loadingProduct();

    bindingProductHome();
}

function productFilter(datajson) {
    var arr = new Array();
    $.each(datajson, function (index) {
        var item = datajson[index];
        if (checkBrand(item) && checkCat(item) && checkPrice(item) && item.name.indexOf($('#keywordSearch').val()) != -1) {
            arr.push(item);
            return;
        }
    });

    return JSON.parse(JSON.stringify(arr));
}

function checkPrice(item) {
    var priceMin = $('#priceMinFilter').val();
    var PriceMax = $('#priceMaxFilter').val();
    if (priceMin < item.price && PriceMax > item.price)
        return true;
    return false;
}

function checkBrand(item) {
    if (arrBrand.length == 0)
        return true;
    else {
        for (i = 0; i < arrBrand.length; i++) {
            if (item.brandId == arrBrand[i])
                return true;
        }
    }
    return false;
}

function checkCat(item) {
    if (arrCat.length == 0)
        return true;
    else {
        for (i = 0; i < arrCat.length; i++) {
            if (item.categoryId == arrCat[i])
                return true;
        }
    }
    return false;
}

function loadingProduct() {
    var datajson = productFilter(jsonProduct);
    datajson = addRateDataProduct(datajson);
    datajson = sortItemJsonByRate(datajson, true, 'rate');

    if ($('#sort-product-category').val() == 'price')
        datajson = sortItemJsonByRate(datajson, false, 'price');
    else if ($('#sort-product-category').val() == 'name')
        datajson = sortItemJsonByRate(datajson, true, 'name');
    else if ($('#sort-product-category').val() == 'priceDesc')
        datajson = sortItemJsonByRate(datajson, true, 'price');

    var String = '';
    $.each(datajson, function (index) {
        var item = datajson[index];
        if (Stringsadsa.indexOf(',' + item.categoryId + ',') != -1) {
            var url = urlForm + '/product/shop/getdetail?1=1&shopId=' + item.shopId;
            var jsonShop = getDataJson(url);
            String += '<li class="col-sx-12 col-sm-4">' +
                    '<div class="product-container">' +
                    '<div class="left-block">' +
                    '<a href="' + urlForm + '/product/' + item.id + '">' +
                    '<img class="img-responsive" alt="product" src="' + item.image + '" />' +
                    '</a>' +
                    '<div class="quick-view">' +
                    '<a title="Add to my wishlist" class="heart" href="#"></a>' +
                    '<a title="Add to compare" class="compare" href="#"></a>' +
                    '<a title="Quick view" class="search" href="#"></a>' +
                    '</div>' +
                    '</div>' +
                    '<div class="right-block">' +
                    '<h5 class="product-name"><a href="#">' + item.name + '</a></h5>' +
                    createRate(item) +
                    '</div>' +
                    '<div class="content_price">' +
                    '<span class="price product-price">' + formatNumberPrice(item.price, 'VND') + '</span>' +
                    // '<span class="price old-price">$52,00</span>' +
                    '</div>' +
                    '<div class="info-orther">' +
                    '<p>Item Code: #' + item.id + '</p>' +
                    '<p class="availability">Availability: <span>In stock</span></p>' +
                    '<div class="product-desc">' +
                    '<div class="product-desc"><h3 style="font-weight: bold;">Shop: ' + jsonShop[0].name + '</h3>' +
                    'Phone: ' + jsonShop[0].phone +
                    '</br>Address: ' + jsonShop[0].address +
                    '</br>Email: ' + jsonShop[0].email +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="add-to-cart">' +
                    '<a title="Add to Cart" href="#add"><span></span>Add to Cart</a>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</li>';
        }
    });
    $('#Product-ListCat').html(String);

}

function numberOfProductInCatBrand(id, loai) {
    StringCatArray = ',' + id + ',';
    findCategoryChild1(catJson, ',' + id + ',');

    var numberCat = 0;
    var numberBrand = 0;

    $.each(jsonProduct, function (index) {
        var item = jsonProduct[index];
        if (StringCatArray.indexOf(',' + item.categoryId + ',') != -1) {
            numberCat++;
        }
        if (item.brandId == id && Stringsadsa.indexOf(',' + item.categoryId + ',') != -1)
            numberBrand++;
    });
    if (loai == 'cat')
        return numberCat;
    else
        return numberBrand;
}

var StringCatArray;
function findCategoryChild1(datajson, parentId) {
    var loop = false;
    var String = ",";
    $.each(datajson, function (index) {
        var item = datajson[index];
        if (parentId.indexOf(',' + item.parentId + ',') != -1) {
            String = String + item.id + ',';
            StringCatArray = StringCatArray + item.id + ',';
            loop = true;
        }
    });
    if (loop)
        findCategoryChild1(datajson, String)
    return String;
}

function createLinkCat(catId) {
    var nameCat = '';
    $.each(catJson, function (index) {
        var item = catJson[index];
        if (item.id == catId)
            nameCat = item.name;
    });
    $('#link-category').html('<a class="home" href="' + urlForm + '" title="Return to Home">Home</a>' +
            '<span class="navigation-pipe">&nbsp;</span>' +
            '<a href="#" title="Return to Home">' + nameCat + '</a>');

    $('#page-heading-title').html(nameCat);
}

function createCategoryFilter() {
    var String = '<ul class="check-box-list">';
    $.each(catJson, function (index) {
        var item = catJson[index];
        if (Stringsadsa.indexOf(',' + item.id + ',') != -1 && item.id != $('#idCategoryDetail').val()) {
            String += '<li>' +
                    '<input type="checkbox" class="cat_Checkbox" id="cat_Checkbox_' + item.id + '" name="cat[]" value="' + item.id + '"/>' +
                    '<label for="cat_Checkbox_' + item.id + '">' +
                    '<span class="button"></span>' +
                    item.name + '<span class="count">(' + numberOfProductInCatBrand(item.id, 'cat') + ')</span>' +
                    '</label>' +
                    '</li>';
        }
    });
    String += '</ul>';

    $('#categoryFilter').html(String);
}

function createBrand() {
    var url = urlForm + '/admin/brand/getlist?1=1';
    var datajson = getDataJson(url);
    var String = '<ul class="check-box-list">';
    $.each(datajson, function (index) {
        var item = datajson[index];
        String += '<li>' +
                '<input type="checkbox" class="brand_Checkbox" value="' + item.id + '" id="brand_Checkbox_' + item.id + '" name="brand[]" />' +
                '<label for="brand_Checkbox_' + item.id + '">' +
                '<span class="button"></span>' +
                item.name + '<span class="count">(' + numberOfProductInCatBrand(item.id, 'brand') + ')</span>' +
                '</label>' +
                '</li>';
    });
    String += '</ul>';
    $('#category-brand').html(String);
}
