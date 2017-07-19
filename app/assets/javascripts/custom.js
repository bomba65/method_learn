$(document).ready(function(){
  $('.carousel').carousel({
  interval: 3000
})

    $('li a').click(function(){
      $('html, body').animate({
          scrollTop: $( $(this).attr('href') ).offset().top
      }, 1500); // можно менять время
      return false;
  });
  $(document).ready(function(){
function Rotator(start_from){
    var phrases = ["Добро пожаловать в Метод!","Искренне рады очередной встрече!","Желаем продуктивного дня!"];
    var total = phrases.length;
    var interval = 1500;
    if(void 0 === start_from){
        start_from = 0;
    }

    $(".textrotator").text(phrases[start_from]).animate({"opacity":"1"}, 1000, function(){
                if(start_from >= (total-1)){
                    setTimeout(function(){
                        $(".textrotator").animate({"opacity":"0"}, 1000, function(){
                            Rotator();
                        });
                    }, interval);
                }else{
                    start_from++;
                    setTimeout(function(){
                        $(".textrotator").animate({"opacity":"0"}, 1000,function(){
                            Rotator(start_from);
                        });
                    }, interval);

                }

    })
}

Rotator();
})

})
<!--когда будет все готова подклбчи эту функцию-->
