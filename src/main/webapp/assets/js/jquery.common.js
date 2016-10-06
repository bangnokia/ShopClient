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
                alert('Fail get data!');
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
            var message = data.map.message;
            if (message == 'success_ok') {
                dataJson = eval(data.map.result);
                loi = true;
                if (p_function_run != undefined && p_function_run != '')
                    eval(p_function_run);
            } else {
                dataJson = null;
                alert('Fail get data!');
                loi = false;
            }
        },
        failure: function (errMsg) {
            alert('fail');
        }
    });
    return loi;
}