var openMenu = "";
/*FUNCION PARA MANEJO DE SLIDESHOW*/
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
}
/* FIN FUNCION PARA MANEJO DE SLIDESHOW*/

$(document).ready(function() {

    
    /* SE LLAMA A LA FUNCION PARA MANEJO DE SLIDESHOW*/
    showSlides(slideIndex);


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
