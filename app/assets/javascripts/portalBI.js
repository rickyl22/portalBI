var openMenu = "";

/*FUNCION PARA CONSULTA EN ELASTICSEARCH*/
function busqueda_elasticsearch(query) {
   // var resultado = 0;
    $.ajax({
        url: 'http://localhost:9200/portal_mercadeo/_search',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json',
        crossDomain: true,
        data: JSON.stringify(query),
        success: function(data) {
            var resultado = 0;
            console.log("DATA CRUDA "+data);
            $("#results").empty();
            $("#results").append("<p>Results for <b>" +"</b></p>");
            $.each(data.hits.hits, function(i,item){
                console.log("Aqui resultado "+JSON.stringify(item));
                $("#results").append("<div><a href='#'>" + item._source.BS_BANCARIA+ "</a></div>");
                resultado = resultado+item._source.BS_BANCARIA;
            });
            $("#results").append("<div><a href='#'>" + resultado+ "</a></div>");
        }

    });
}

/*FUNCION PARA HABILITAR-DESHABILITAR USUARIOS*/
function habilitar(e) {
    var id = $(e).attr("id");
    var val =  $(e).val();
    var check = $("#estatus_usuario_"+id);
    if(val == ""){
        $(check).prop("disabled", true);
    }else{
        $(check).prop("disabled", false);
    }
}

$(document).ready(function() {
    /*FUNCION PARA CONTRAER Y DESPLEGAR DETALLES*/
    $(".us_detalle").click(function(){
        console.log("entra aca");
        $(this).next().toggle(1000);
    });

    /*FUNCION PARA VISUALIZAR-OCULTAR SUBMENU*/
    $(".menu").click(function() {
        var subMenuToAppear = $(this).next("div");
        var idSubMenuToAppear = $(this).next("div").attr("id");
        openMenu = idSubMenuToAppear;
        console.log("id a dejar abierto = " + openMenu);
        $(".sub-menu-container").each(function() {
            console.log("Entra= " );
            console.log("Los id "+idSubMenuToAppear+" donde estoy "+$(this).attr("id") );
            if (idSubMenuToAppear != $(this).attr("id")) {
                console.log("ID son iguales" );
                $(this).slideUp();
                $(this).parent().find(".material-icons.list").text("add");
            }
        });
        //subMenuToAppear.slideToggle();
        subMenuToAppear.slideDown();
        var masMenos = $(this).find(".material-icons.list").text();
        if (masMenos == "add") {
            $(this).find(".material-icons.list").text("remove");
        } else {
            $(this).find(".material-icons.list").text("add");
        }

    });


});
