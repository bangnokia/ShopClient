function shopmanage() {
    checkShopId();

    $('#saveForm').bind('click', function () {
        if ($('#frm_addshop_userId').val() == '') {
            alert('login first!');
            return;
        }
        do_save_form(urlForm + '/product/shop/save', 'frm_addshop', 'checkShopId();');
    });
}

function checkShopId() {
    var url = urlForm + '/product/shop/getlist?1=1&userId=' + $('#dsaccsacsagsagsdwefe').val();
    var datajson = getDataJson(url);
    $('#frm_addshop_userId').val($('#dsaccsacsagsagsdwefe').val())

    if (datajson == null) {
        $('#titleShop').html('You don\'t have a shop, register now!');
        $('#saveForm').html('Register');
    } else {
        $('#titleShop').html('Manager your shop!');
        $('#saveForm').html('Update');
        bindItemDetail(datajson, 'frm_addshop');
        console.log(datajson[0]);
    }
}