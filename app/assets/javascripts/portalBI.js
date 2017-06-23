var openMenu = "";
var clicked = 0;

function foo(thiss) {
  $(thiss).next().toggle(1000);

  }

$(document).ready(function() {
    /*FUNCION PARA CONTRAER Y DESPLEGAR DETALLES
    $(".us_detalle").click(function(){
        
        if (clicked == 0){
            console.log("0000");
            $(this).next().show(1000);
            clicked = 1;
        }else{
            console.log("11111");
            $(this).next().hide(1000);
            clicked = 0;
        }
    });*/

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
