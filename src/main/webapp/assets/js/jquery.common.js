var timeout = 500;

function getDataJson(p_url) {
    var dataJson = '';
    var source = {
        datatype: "json",
        type: 'POST',
        url: p_url,
        async: false,
        beforeprocessing: function (data) {
            var message = data.map.message;
            if (message == 'success_ok') {
                dataJson = eval(data.map.result);
            } else {
                dataJson = null;
                if (message != 'success_fail') {
                    showNotification('error', message);
                } else {
                    showNotification('error', 'Fail get data!');
                }
            }
        }
    };
    var dataAdapter = new $.jqx.dataAdapter(source);
    dataAdapter.dataBind();
    return dataJson;
}

function bindItemDetail(dataLocal, formName) {

    var column_value;

    if (dataLocal == null || dataLocal.length == 0)
        return;

    $('#' + formName).find('input, textarea, select').each(function (index, field) {
        if (field.name != null && field.name != '') {

            temp = " column_value = dataLocal[0]." + field.name + ";";
            eval(temp);

            if (typeof column_value != 'undefined' && column_value != null) {
                field.value = column_value;
            }
        }
    });
}

function bindItemDetailGrid(dataLocal, formName) {

    var column_value;

    if (dataLocal == null || dataLocal.length == 0)
        return;

    $('#' + formName).find('input, textarea, select').each(function (index, field) {
        if (field.name != null && field.name != '') {

            temp = " column_value = dataLocal." + field.name + ";";
            eval(temp);

            if (typeof column_value != 'undefined' && column_value != null) {
                field.value = column_value;
            }
        }
    });
}

function bindingcombo(p_name, p_selectedValue, datajson, arrColum) {
    var arrName = p_name.split(',');
    for (var i = 0; i < arrName.length; i++) {
        var temp = generateOptionCombobox(datajson, p_selectedValue, arrColum);
        temp = "$('#" + $.trim(arrName[i]) + "').html('" + temp.replace(/'/g, '') + "');";
        eval(temp);
    }
}

function generateOptionCombobox(p_dataCombobox, p_selectedValue, arrColum) {
    arrColum = arrColum.split(',');
    var temp = '';
    if (p_selectedValue == '')
        temp += '<option value=""> --- Select --- </option>';
    $.each(p_dataCombobox, function (index) {
        var item = p_dataCombobox[index];
        var Ma = eval('item.' + $.trim(arrColum[0]));
        var Ten = eval('item.' + $.trim(arrColum[1]));
        if (Ma == p_selectedValue)
            temp += '<option value="' + Ma + '" selected="selected">' + Ten + '</option>';
        else
            temp += '<option value="' + Ma + '">' + Ten + '</option>';
    });

    return temp;
}

function do_save_form(p_url, p_formName, p_function_run) {
    var dataSent = '1=1';
    var loi = false;

    $('#' + p_formName).find(':input').each(function (index) {
        var input = $(this);
        if (this.id.indexOf(p_formName + '_') != -1)
            dataSent += '&' + input.attr('name') + '=' + input.val();
    });

    $.ajax({
        datatype: "json",
        url: p_url,
        type: "POST",
        data: dataSent,
        success: function (data) {
            if (data != undefined && data != '') {
                data = eval('[' + data + ']');
            }
            var message = data[0].map.message;
            if (message == 'success_ok') {
                dataJson = eval(data[0].map.result);
                loi = true;
                if (p_function_run != undefined && p_function_run != '')
                    eval(p_function_run);
                showNotification('success', 'Save success');
            } else {
                dataJson = null;
                if (message != 'success_fail') {
                    showNotification('error', message);
                } else {
                    showNotification('error', 'Fail get data!');
                }
                loi = false;
            }
        },
        failure: function (errMsg) {
            showNotification('error', 'Fail to save!');
        }
    });
    return loi;
}

function do_delete_form(p_url, p_function_run) {
    var dataSent = '1=1';
    var loi = false;

    $.ajax({
        datatype: "json",
        url: p_url,
        type: "POST",
        data: dataSent,
        success: function (data) {
            if (data != undefined && data != '') {
                data = eval('[' + data + ']');
            }
            var message = data[0].map.message;
            if (message == 'success_ok') {
                dataJson = eval(data[0].map.result);
                loi = true;
                if (p_function_run != undefined && p_function_run != '')
                    eval(p_function_run);
                showNotification('success', 'Delete success');
            } else {
                dataJson = null;
                showNotification('error', 'Fail to delete!');
                loi = false;
            }
        },
        failure: function (errMsg) {
            showNotification('error', 'Fail to delete!');
        }
    });
    return loi;
}

function loadingForm(status) {
    try {
        if (status) {
            $('#div_loadingContent').show();
            var width = $('#div_loadingContent').width();
            var height = $('#div_loadingContent').height();
            var width1 = $('#loadingContent').width();
            var height1 = $('#loadingContent').height();
            $('#loadingContent').css('margin-left', (width - width1) / 2 + 'px');
            $('#loadingContent').css('margin-top', (height - height1) / 2 + 'px');
        } else
            $('#div_loadingContent').hide();
    } catch (Exception) {
        alert('Lỗi loading');
    }
}

function clear_form(p_name, skip) {
    $('#' + p_name).find(':input').each(function () {
        if (this.id != p_name + '_' + skip) {
            switch (this.type) {
                case 'select':
                case 'select-multiple':
                case 'select-one':
                    //$('select option:first-child').attr("selected", "selected");
                    $(this).val($("#" + this.id + " option:first").val());
                    break;
                case 'text':
                case 'textarea':
                case 'password':
                case 'hidden':
                    $(this).val('');
                    break;
                case 'checkbox':
                case 'radio':
                    this.checked = false;
            }
        }
    });
}

function showNotification(template, message) {
    $("#div_message_notification").html('<div id="messageNotification"></div>');
    $("#messageNotification").html(message);

    $("#messageNotification").jqxNotification({
        position: "top-right",
        width: "100%",
        appendContainer: "#containerNotification",
        opacity: 0.9,
        autoOpen: true,
        autoClose: true,
        autoCloseDelay: 500,
        template: template
    });
}

function SearchItemJson(data, colum, value) {
    if (value == undefined || value == '' || colum == undefined || colum == '') {
        return data;
    }

    var arr = new Array();
    //if(data != null && )

}

function sortItemJsonByRate(data, status, loai) {
    var arr = new Array();
    $.each(data, function (index) {
        var item = data[index];
        arr.push(item);
    });
    if (loai == 'rate') {
        arr.sort(function (a, b) {
            if (status)
                return parseFloat(b.rate) - parseFloat(a.rate);
            else
                return parseFloat(a.rate) - parseFloat(b.rate);
        });
    } else if (loai == 'price') {
        arr.sort(function (a, b) {
            if (status)
                return parseFloat(b.price) - parseFloat(a.price);
            else
                return parseFloat(a.price) - parseFloat(b.price);
        });
    } else if (loai == 'name') {
        arr.sort();
    }
    return JSON.parse(JSON.stringify(arr));
}

function formatNumberPrice(n, currency) {
    return  n.toFixed().replace(/./g, function (c, i, a) {
        return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
    }) + " " + currency;
}

function caculaterRate(product) {
    var sum = 0;
    var numberRate = 0;
    $.each(jsonRate, function (index) {
        var item = jsonRate[index];
        if (item.productId == product.id) {
            sum = sum + parseInt(item.rate);
            numberRate++;
        }
    });
    return sum / numberRate;
}

function numberOfRate(product) {
    var numberRate = 0;
    $.each(jsonRate, function (index) {
        var item = jsonRate[index];
        if (item.productId == product.id) {
            numberRate++;
        }
    });
    return numberRate;
}

function createRate(product) {
    var String = '<div class="product-star">';
    var rate = caculaterRate(product);
    rate = Math.round(rate * 10) / 10;
    for (i = 0; i < 5; i++) {
        if (i < rate) {
            String += '<i class="fa fa-star"></i>';
        } else {
            if ((rate - i) > 0.5) {
                String += '<i class="fa fa-star-half-o"></i>';
            } else {
                String += '<i class="fa fa-star-o"></i>';
            }
        }
    }
    return String;
}

function createRate1(rate) {
    var String = '<span class="reviewRating" >';
    rate = Math.round(rate * 10) / 10;

    for (i = 0; i < 5; i++) {
        if (i < rate) {
            String += '<i class="fa fa-star"></i>';
        } else {
            if ((rate - i) > 0.5) {
                String += '<i class="fa fa-star-half-o"></i>';
            } else {
                String += '<i class="fa fa-star-o"></i>';
            }
        }
    }
    String += '</span>';
    return String;
}

function addRateDataProduct(data) {
    var arr = new Array();
    $.each(data, function (index) {
        var item = data[index];
        var rate = caculaterRate(item);
        if (isNaN(rate))
            rate = 0;
        item.rate = rate;
        arr.push(item);
    });
    return JSON.parse(JSON.stringify(arr));
}

var Stringsadsa;
function findCategoryChild(datajson, parentId) {
    var loop = false;
    var String = ",";
    $.each(datajson, function (index) {
        var item = datajson[index];
        if (parentId.indexOf(',' + item.parentId + ',') != -1) {
            String = String + item.id + ',';
            Stringsadsa = Stringsadsa + item.id + ',';
            loop = true;
        }
    });
    if (loop)
        findCategoryChild(datajson, String)
    return String;
}

//function findCategoryChild123(datajson, parentId) {
//    var kq = ''
//    if (parentId == undefined || parentId == '')
//        return '';
//    $.each(datajson, function (index) {
//        var item = datajson[index];
//        if (parentId == item.parentId) {
//            kq = kq + item.id + findCategoryChild123(datajson, item.id)
//        }
//    });
//    return kq;
//}