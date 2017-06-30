var catJson;
var jsonProduct;
var uesrIdform;
var totalprice = 0;
var idTemp = 0;
var pagetemp = 1;
var shopid = 0;

function ShopOrder() {
    $("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });

    $("[data-toggle=tooltip]").tooltip();

    $('#btnSearch').bind('click', function () {
        getListOrder(pagetemp);
    });
    getListOrder(1);

    $('#btndelivered').bind('click', function () {
        var selected = '';
        $('#bodyItemProduct input:checked').each(function () {
            selected += ',' + $(this).val();
        });

        $('#frm_order_orderid').val(idTemp);
        $('#frm_order_arrp').val(selected.replace(',', ''));

        if (selected.replace(',', '') == '') {
            alert('please choise product!');
            return;
        }

        do_save_form(urlForm + '/shoporder/saveorder', 'frm_order', 'idTemp=0; getListOrder(' + pagetemp + ')');
    });
}

function getListOrder(page) {
    pagetemp = page;
    for (var i = 0; i < 5; i++) {
        $('#ccc_page_' + i).removeClass('active');
    }
    $('#ccc_page_' + page).addClass('active');

    var url = urlForm + '/product/shop/getlist?1=1&userId=' + $('#dsaccsacsagsagsdwefe').val();
    var datajson = getDataJson(url);
    shopid = datajson[0].id;
    var url = urlForm + '/shoporder/getlistbyshop?1=1&text=' + $('#frm_search_name').val() + '&shopid=' + shopid + '&page=' + page;
    var datajson = getDataJson(url);

    $('#table_orderList').html('');
    if (datajson == null)
        return;
    var string = '';
    $.each(datajson, function (index) {
        var item = datajson[index];
        var url = urlForm + '/shoporder/getstatusorder?1=1&shopid=' + shopid + '&orderid=' + item.id;
        var jsonstatusOrder = getDataJson(url);

        if ($('#frm_search_status').val() == '' || $('#frm_search_status').val() == jsonstatusOrder) {
            if (jsonstatusOrder == 1)
                var status = '<td style="color: goldenrod;text-align: center;">Unfinished</td>';
            else if (jsonstatusOrder == 2)
                var status = '<td style="color: blue;text-align: center;">Shipping</td>';
            else if (jsonstatusOrder == 3)
                var status = '<td style="color: green; text-align: center;">Done</td>';

            string += '<tr>' +
                    '<td><input type="checkbox" class="checkthis" /></td>' +
                    '<td>' + item.createdAt + '</td>' +
                    '<td>' + item.name + '</td>' +
                    '<td>' + item.address + '</td>' +
                    '<td>' + item.email + '</td>' +
                    '<td>' + item.phone + '</td>' +
                    status +
                    '<td style="text-align: center;"><p data-placement="top" data-toggle="tooltip" title="Edit"><button onclick="detailorder(' + shopid + ',' + item.id + ')" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil" style="padding-top: 2px;"></span></button></p></td>' +
                    //'<td style="text-align: center;"><p data-placement="top" data-toggle="tooltip" title="Delete">' +
                    // ((item.status == 1 || item.status == 2) ? '' : '<button onclick="deleteorder(' + item.id + ')" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash" style="padding-top: 2px;"></span></button>') +
                    // '</p></td>' +
                    '</tr>';
        }
    });

    $('#table_orderList').html(string);
}

function detailorder(id, orderid) {
    if (idTemp != orderid) {
        idTemp = orderid;
    } else {
        return;
    }

    var url = urlForm + '/shoporder/getdetailbyshop?1=1&shopid=' + id + '&orderid=' + orderid;
    var jsonCartOrder = getDataJson(url);

    if (jsonCartOrder == null)
        return;
    var string = '';
    var numberitem = 0;
    var price = 0;
    if (jsonCartOrder != null) {
        $.each(jsonCartOrder, function (index) {
            var item1 = jsonCartOrder[index];
            numberitem++;
            var url = urlForm + '/product/create/getdetail?1=1&id=' + item1.productId;
            var datajson = getDataJson(url);
            var item = datajson[0];
            totalprice += item.price;

            if (item1.status == 1)
                var status = '<td style="color: green; text-align: center;">Done</td>';
            else
                var status = '<td style="color: goldenrod;text-align: center;">Shipping</td>';

            string += '<tr>' +
                    '<td><input type="checkbox" checked disabled value="' + item1.productId + '" style="zoom: 1.5;" /></td>' +
                    '<td class="cart_product">' +
                    '<a href="#"><img src="' + item.image + '" alt="Product"></a>' +
                    '</td>' +
                    '<td class="cart_description">' +
                    '<p class="product-name"><a href="#">' + item.name + '</a></p>' +
                    // '<small class="cart_ref">SKU : #123654999</small><br>' +
                    // '<small><a href="#">Color : Beige</a></small><br>   ' +
                    // '<small><a href="#">Size : S</a></small>' +
                    '</td>' +
                    '<td class="cart_avail"><span class="label label-success">In stock</span></td>' +
                    '<td class="price"><span>' + formatNumberPrice(item.price, 'VND') + '</span></td>' +
                    '<td class="qty">' + item1.quantity +
                    '</td>' +
                    '<td class="price">' +
                    '<span id="price_' + item.id + '" accesskey="' + item.price + '">' + formatNumberPrice(item.price, 'VND') + '</span>' +
                    '</td>' +
                    status +
                    '</tr>';
            price = parseFloat(price) + parseFloat(item.price) * parseFloat(item1.quantity);
        });
    }

    $('.totalPriceOrder').html(formatNumberPrice(price, 'VND'));

    $('#numberProductOrder').html(numberitem + ' Product');
    $('#bodyItemProduct').html(string);
}

function deleteorder(id) {
    if (typeof id == typeof undefined || id == null || id == '') {
        alert('select order to delete');
        return;
    }

    $('#btnDeleteOrder').unbind('click');
    $('#btnDeleteOrder').bind('click', function () {
        do_delete_form(urlForm + '/myorder/delete?id=' + id, 'getListOrder(' + pagetemp + ');');
    });
}
