var catJson;
var jsonProduct;
var uesrIdform;
var totalprice = 0;

function Order() {
    if (typeof $('#dsaccsacsagsagsdwefe').val() == typeof undefined || $('#dsaccsacsagsagsdwefe').val() == '') {
        alert("login before!");
        window.location.href = urlForm + '/auth/login?backurl=order';
    }

    var arr = new Array();
    $.each(jsonCartOrder, function (index) {
        var item = jsonCartOrder[index];
        item.qty = 1;
        arr.push(item);
    });
    jsonCartOrder = JSON.parse(JSON.stringify(arr));
    bindingProductOrder();

    $('.btn-circle').on('click', function () {
        $('.btn-circle.btn-info').removeClass('btn-info').addClass('btn-default');
        $(this).addClass('btn-info').removeClass('btn-default').blur();

        var $activeTab = $('.tab-pane.active');
        var currentID = $activeTab[0].id;
        var goID = $(this).attr("href").replace('#', '');
        goEventOrder(currentID, goID);
    });

    $('.next-step, .prev-step').on('click', function (e) {
        var $activeTab = $('.tab-pane.active');
        var currentID = $activeTab[0].id;
        var nextTab = $activeTab.next('.tab-pane').attr('id');

        $('.btn-circle.btn-info').removeClass('btn-info').addClass('btn-default');

        if ($(e.target).hasClass('next-step'))
        {
            var nextTab = $activeTab.next('.tab-pane').attr('id');
            $('[href="#' + nextTab + '"]').addClass('btn-info').removeClass('btn-default');
            $('[href="#' + nextTab + '"]').tab('show');
        } else
        {
            var prevTab = $activeTab.prev('.tab-pane').attr('id');
            $('[href="#' + prevTab + '"]').addClass('btn-info').removeClass('btn-default');
            $('[href="#' + prevTab + '"]').tab('show');
        }

        goEventOrder(currentID, nextTab);
    });

    $('#btnSaveOrder').bind('click', function () {
        var product = '';
        $.each(jsonCartOrder, function (index) {
            var item = jsonCartOrder[index];
            product += 'SEPARATE' + item.id + ';' + item.qty;
        });
        $('#frm_order_type').val($('input[name="type"]:checked').val());
        $('#frm_order_product').val(product);
        if (product == '') {
            alert("Don't have any item in your cart!");
            return;
        }
        do_save_form(urlForm + '/order/save', 'frm_order', ' clearCart();');
    });
}

function goEventOrder(currentID, nextTab) {
    if (nextTab == 'menu3') {
        if ($('#frm_order_name').val() == '')
            $('#frm_order_name').val($('#vsavscssaadadeadsa').val());
        if ($('#frm_order_phone').val() == '')
            $('#frm_order_phone').val($('#cscacsasadsad').val());
        if ($('#frm_order_address').val() == '')
            $('#frm_order_address').val($('#cdavassacsc').val());
        if ($('#frm_order_email').val() == '')
            $('#frm_order_email').val($('#vsavsadadeadsa').val());
        if ($('#frm_order_userId').val() == '')
            $('#frm_order_userId').val($('#dsaccsacsagsagsdwefe').val());
    }
}

function bindingProductOrder() {
    var string = '';
    var numberitem = 0;
    if (jsonCartOrder != null) {
        $.each(jsonCartOrder, function (index) {
            var item = jsonCartOrder[index];
            numberitem++;
            totalprice += item.price;
            string += '<tr>' +
                    '<td class="cart_product">' +
                    '<a href="#"><img src="' + item.image + '" alt="Product"></a>' +
                    '</td>' +
                    '<td class="cart_description">' +
                    '<p class="product-name"><a href="#">' + item.name + '</a></p>' +
                    '<small class="cart_ref">SKU : #123654999</small><br>' +
                    '<small><a href="#">Color : Beige</a></small><br>   ' +
                    '<small><a href="#">Size : S</a></small>' +
                    '</td>' +
                    '<td class="cart_avail"><span class="label label-success">In stock</span></td>' +
                    '<td class="price"><span>' + formatNumberPrice(item.price, 'VND') + '</span></td>' +
                    '<td class="qty">' +
                    '<input maxlength="4" class="form-control input-sm inputNumberINT" accesskey="' + item.id + '" type="text" value="1">' +
                    '</td>' +
                    '<td class="price">' +
                    '<span id="price_' + item.id + '" accesskey="' + item.price + '">' + formatNumberPrice(item.price, 'VND') + '</span>' +
                    '</td>' +
                    '<td class="action">' +
                    '<a href="#" onclick="deleteCart(' + item.id + ');bindingProductOrder();">Delete item</a>' +
                    '</td>' +
                    '</tr>';
        });
    }

    totalPriceCaculate();
    $('#numberProductOrder').html(numberitem + ' Product');
    $('#bodyItemProduct').html(string);
    $('.inputNumberINT').bind('keydown', function (event) {
        if ((event.keyCode > 57 || event.keyCode < 48) && (event.keyCode > 105 || event.keyCode < 96) && event.keyCode != 8 && event.keyCode != 46) {
            event.preventDefault();
        }
    });

    $('.inputNumberINT').bind('change', function () {
        var id = $(this).attr('accesskey');
        var number = $(this).val();
        if (number == '')
            number = 0;
        var arr = new Array();
        $.each(jsonCartOrder, function (index) {
            var item = jsonCartOrder[index];
            if (id == item.id) {
                $('#price_' + id).html(formatNumberPrice(parseFloat(number) * parseFloat(item.price), 'VND'));
                item.qty = number;
            }
            arr.push(item);
        });
        jsonCartOrder = JSON.parse(JSON.stringify(arr));
        totalPriceCaculate();
    });
}

function totalPriceCaculate() {
    var price = 0;
    $.each(jsonCartOrder, function (index) {
        var item = jsonCartOrder[index];
        price = parseFloat(price) + parseFloat(item.qty) * parseFloat(item.price);
    });
    $('.totalPriceOrder').html(formatNumberPrice(price, 'VND'));
}
