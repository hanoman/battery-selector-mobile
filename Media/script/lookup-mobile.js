window.onload = function() {
    setTimeout(function() {
        $(document).ready(init("/services/svcJCIBattFind.asmx/GetMakes", 'GET', setXML, '', '', '', ''));
    }, 0);
}

function init(_url, _method, _funct, _data, _year, _model, _engine) {
    if (_model.indexOf("--") != -1) {
        _model = _model.replace('--', '-');
    } else {
        _model = _model.replace('-', ' ');
    }
    var funct = _funct;
    $.ajax({
        cache: false,
        type: _method,
        url: _url,
        data: {
            Make: _data.replace('-', ' '),
            Year: _year,
            Model: _model,
            EngineSize: _engine
        },
        contentType: 'text/xml; charset=utf-8',
        dataType: 'xml',
        success: funct,
        error: function(jqXHR, textStatus, errorThrown) {
            alert('error');
        }
    });
}

function setXML(_xml) {
    var curCountry = $(_xml).find('Make');
    $(curCountry).each(function(i) {
        var country = $(this);
        var makeCar = country.text();
        makeCar.replace(' ', '-');
        $("#TRM_dd_AUTO_MAKE").append("<option value=" + makeCar.replace(' ', '-') + ">" + country.text() + "</option>");
    })
}

$(document).ready(function() {

    $("#TRM_dd_AUTO_MAKE").change(function() {
        var selected = $(this).val(); // or this.value
    });
})



function setYears(_xml) {
    var curCountry = $(_xml).find('Year');

    var optionSelected = $('#TRM_dd_AUTO_MAKE').val();
    if (optionSelected == 'null') {

        $("#TRM_dd_AUTO_YEAR").append("<option>Please select one</option>");

        document.getElementById('TRM_dd_AUTO_MODEL').selectedIndex = 0;

        $('#TRM_dd_AUTO_YEAR').prop('disabled', true);
        $("#TRM_dd_AUTO_YEAR").css("color", "#999");
        $('#TRM_dd_AUTO_MODEL').prop('disabled', true);
        $("#TRM_dd_AUTO_MODEL").css("color", "#999");
        $('#TRM_dd_AUTO_ENGINE').prop('disabled', true);
        $("#TRM_dd_AUTO_ENGINE").css("color", "#999");

    } else {

        $("#TRM_dd_AUTO_YEAR").append("<option value='null'>Please Select One</option>");
        $(curCountry).each(function(i) {
            var country = $(this);
            $("#TRM_dd_AUTO_YEAR").append("<option value=" + country.text() + ">" + country.text() + "</option>");
        })
        $("#TRM_dd_AUTO_YEAR").html($('#TRM_dd_AUTO_YEAR option').sort(function(x, y) {
            return $(x).val() > $(y).val() ? -1 : 1;
        }))
        $("#TRM_dd_AUTO_YEAR").get(0).selectedIndex = 0;
    }

}

function selectYear() {
    document.getElementById("TRM_dd_AUTO_YEAR").innerHTML = "";
    var carSelected = $('#TRM_dd_AUTO_MAKE').val();
    init("/services/svcJCIBattFind.asmx/GetYears", "GET", setYears, carSelected, '', '', '');
    $('#TRM_dd_AUTO_YEAR').prop('disabled', false);
    $("#TRM_dd_AUTO_YEAR").css("color", "#000");
}

function setModel(_xml) {
    var curModel = $(_xml).find('Model');
    $("#TRM_dd_AUTO_MODEL").append("<option value='null'>Please Select one</option>");
    $(curModel).each(function(i) {
        var myModel = $(this);
        var modelCar = myModel.text();
        var mymodel;
        //alert(modelCar.indexOf("-") != -1);
        if (modelCar.indexOf("-") != -1) {
            mymodel = modelCar.replace('-', '--');
        } else {
            mymodel = modelCar.replace(' ', '-');
        }
        modelCar.replace(' ', '-');
        $("#TRM_dd_AUTO_MODEL").append("<option value=" + mymodel + ">" + modelCar + "</option>");
    })
}

function selectModel() {
    document.getElementById("TRM_dd_AUTO_MODEL").innerHTML = "";
    var yearSelected = $('#TRM_dd_AUTO_YEAR').val();
    var carSelected = $('#TRM_dd_AUTO_MAKE').val();
    if (yearSelected == 'null') {
        $("#TRM_dd_AUTO_MODEL").append("<option>Please select one</option>");
        $('#TRM_dd_AUTO_MODEL').prop('disabled', true);
        $("#TRM_dd_AUTO_MODEL").css("color", "#999");
        $('#TRM_dd_AUTO_ENGINE').prop('disabled', true);
        $("#TRM_dd_AUTO_ENGINE").css("color", "#999");
        $('select#TRM_dd_AUTO_MODEL').val('null');
    } else {
        init("/services/svcJCIBattFind.asmx/GetModels", "GET", setModel, carSelected, yearSelected, '', '');
        $('#TRM_dd_AUTO_MODEL').prop('disabled', false);
        $("#TRM_dd_AUTO_MODEL").css("color", "#000");
    }
}

function setEngine(_xml) {
    var curCountry = $(_xml).find('Engine');
    $("#TRM_dd_AUTO_ENGINE").append("<option value='null'>Please Select one</option>");
    $(curCountry).each(function(i) {
        var country = $(this);
        $("#TRM_dd_AUTO_ENGINE").append("<option value=" + country.text() + ">" + country.text() + "</option>");
    })

}

function selectEngine() {
    document.getElementById("TRM_dd_AUTO_ENGINE").innerHTML = "";
    var yearSelected = $('#TRM_dd_AUTO_YEAR').val();
    var carSelected = $('#TRM_dd_AUTO_MAKE').val();
    var modelSelected = $('#TRM_dd_AUTO_MODEL').val();
    if (modelSelected == 'null') {
        $("#TRM_dd_AUTO_ENGINE").append("<option>Please select one</option>");
        $('#TRM_dd_AUTO_ENGINE').prop('disabled', true);
        $("#TRM_dd_AUTO_ENGINE").css("color", "#999");
    } else {
        init("/services/svcJCIBattFind.asmx/GetEngineSizes", "GET", setEngine, carSelected, yearSelected, modelSelected, '');
        $('#TRM_dd_AUTO_ENGINE').prop('disabled', false);
        $("#TRM_dd_AUTO_ENGINE").css("color", "#000");
    }
}

function setBatteries(_xml) {

    var path = 'media/images/thumb/';
    var batteries = $(_xml).find('Battery');

    $.mobile.changePage("#resultPage", {
        transition: "fade",
        changeHash: false
    });

    /*console.log(batteries);*/
    $("#TRM_Battery_Head").append("<div class='TRM_theme-solid-rounded TRM_theme-solid-rounded-xl TRM_theme-glass'><h3 class='TRM_h4 TRM_hdg-bold TRM_hdg-shadow TRM_color-reversed'>Your battery match is:</h3></div>");
    $(batteries).each(function(i) {
        var brand = $(this).find("Brand").text();
        var PartNumber = $(this).find("PartNumber").text();
        var batImages = $(this).find("ImageName").text();
        var editedimage = batImages.replace("/", "");
        var PartNumberFormat = PartNumber.replace("/", "-").replace(" ", "-");
        var batSpec = $("#battery-spec").find("#" + PartNumberFormat).html();

        if (batSpec == null) {
            batSpec = "";
        }

        $(".TRM_brand-battery-finder").css('background-image', 'none');
        $("#TRM_Battery_Details").append("<ul class='battery-details-list'><li><div class='battery-details-item'><div class='battery-thumb TRM_media-element-sp'><img src='" + path + editedimage + "'></div> <div class='TRM_media-bd TRM_rotator-battery-info battery-info'><h4>" + brand + "<sup>&#174;</sup></h4><h5>Battery Model No. <span class='battery-info-model'>" + PartNumber + "</span></h5><ul class='TRM_detail-list'>" + batSpec + "</ul><a href='http://m.samsclub.com/locator' class='btn small darkBlue' track='findAClub" + PartNumberFormat + "'>Find a Club</a></div></div></li></ul>");
    })
}

function hrefModify() {
    var url = "default.aspx";
    // $(location).attr('href',url);

    $.mobile.changePage("#homePage", {
        transition: "fade",
        changeHash: false
    });

    $('.TRM_result').css('display', "none");
    $('#TRM_results-header').css('display', "none");
    $('#TRM_Seleted_Details').css('display', "none");
    $('#TRM_Battery_Details').css('display', "none");
}

function getBatteries() {
    var yearSelected = $('#TRM_dd_AUTO_YEAR').val();
    var carSelected = $('#TRM_dd_AUTO_MAKE').val();
    var modelSelected = $('#TRM_dd_AUTO_MODEL').val();
    var engineSelected = $('#TRM_dd_AUTO_ENGINE').val();
    // alert(engineSelected);
    $("#TRM_content").css("display", "none");
    $('#TRM_Seleted_Details').css('display', "block");
    $('#TRM_Battery_Details').css('display', "block");
    $('#TRM_results-header').css('display', "block");
    $('.TRM_result').css('display', "block");

    init("/services/svcJCIBattFind.asmx/GetBatteries", "GET", setBatteries, carSelected, yearSelected, modelSelected, engineSelected);
    $("#TRM_Seleted_Details").append("<div class='mSelected selectedMake'><p class='TRM_h7 TRM_hdg-bold TRM_color-dark'>MAKE&nbsp;</p><p class='highlightSelect'>" + carSelected + "</p></div>");
    $("#TRM_Seleted_Details").append("<div class='mSelected selectedYear'><p class='TRM_h7 TRM_hdg-bold TRM_color-dark'>YEAR&nbsp;</p><p class='highlightSelect'>" + yearSelected + "</p></div>");
    $("#TRM_Seleted_Details").append("<div class='mSelected selectedModel'><p class='TRM_h7 TRM_hdg-bold TRM_color-dark'>MODEL&nbsp;</p><p class='highlightSelect'>" + modelSelected + "</p></div>");
    $("#TRM_Seleted_Details").append("<div class='mSelected selectedEngine'><p class='TRM_h7 TRM_hdg-bold TRM_color-dark'>ENGINE&nbsp;</p><p class='highlightSelect'>" + engineSelected + "</p></div>");

}