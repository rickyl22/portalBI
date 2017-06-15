var openMenu = "";

$(document).ready(function() {

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
