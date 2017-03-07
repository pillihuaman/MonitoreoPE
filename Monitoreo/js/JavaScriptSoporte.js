


$("#Envia").click(function () {
    //Read_Excel() ;
    GEt_Preconciliacion();
});


$("#Enviar_Banco").click(function () {
    //Read_Excel() ;
    Procesar_Proveedores();
});

function Read_Excel() {



    //var fileInput = document.getElementById('File');
    //for (i = 0; i < fileInput.files.length; i++) {

    //    formatdata[i] = fileInput.files[i].name;
    //    //, fileInput.files[i]);

    //}
    var formatdata = new FormData();
    var fileInput = document.getElementById('File');

    for (i = 0; i < fileInput.files.length; i++) {

        formatdata.append(fileInput.files[i].name, fileInput.files[i]);
    }

    //var Jsondata = JSON.stringify({ formatdata: formatdata })

    $.ajax({
        dataType: "json",
        type: "POST",
        traditional: true,
        async: false,
        cache: false,
        Data: formatdata,
        url: '/Home/AddPreconciliacion',
        //context: document.body,

        success: function (Data, index) {
            var trHTML;
            for (i = 0; i <= 2898980000; i++) {
                if (Data[i] != undefined) {
                    trHTML += '<tr><td>' + Data[i] + '</td></tr>'


                }
                else {

                    break;
                }
            }
            $('#tblCIPS').append(trHTML);

        },
        error: function (xhr) {
            //debugger;
            console.log(xhr.responseText);
            alert("Error has occurred..");
        }
    });
}

function GEt_Preconciliacion() {
    if (window.FormData !== undefined) {
        //Read_Excel();

        var formatdata = new FormData();
        var Jsonresponse;
        var fileInput = document.getElementById('File');
        for (i = 0; i < fileInput.files.length; i++) {

            formatdata.append(fileInput.files[i].name, fileInput.files[i]);
        }

        var xhr = new XMLHttpRequest();
        var trHTML;
        xhr.open('POST', '/Home/AddFile');
        xhr.send(formatdata);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {

                Jsonresponse = JSON.parse(xhr.responseText);
                var result = $.parseJSON(xhr.responseText);

                $.each(result, function (k, v) {
                    //display the key and value pair
                    alert(k + ' is ' + v);

                    trHTML += '<tr><td>' + v + '</td></tr>'

                });
                //alert(xhr.responseText);
                //alert(Jsonresponse);

                $('#tblCIPS').append(trHTML);

            }

        }
    }















}

function Procesar_Proveedores() {
    var NombreBanco = document.getElementById('Selectbank');
    var Banco = NombreBanco.options[NombreBanco.selectedIndex].value;
    //var JsonBanco = JSON.stringify({ CIP1: Banco })
    var data = JSON.stringify({
        'Banco': Banco
    });


    $.ajax({
        url: '/Home/ProcesarProvedores',
        contentType: 'application/json; charset=utf-8',
        type: "POST",
        //Data: "JsonBanco=" + JSON.stringify(JsonBanco),
        data: data,
        dataType: "json",


        //context: document.body,

        success: function (data, index) {
            var trHTML;
            for (i = 0; i <= 2898980000; i++) {
                if (data[i] != undefined) {
                    trHTML += '<tr><td>' + data[i] + '</td></tr>'


                }
                else {

                    break;
                }
            }
            $('#tblCIPS').append(trHTML);

        },
        error: function (xhr) {
            //debugger;
            console.log(xhr.responseText);
            alert("Error has occurred..");
        }
    });
}
