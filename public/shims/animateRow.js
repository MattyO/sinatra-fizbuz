$(document).ready(function(){
    console.log("loading jquery annimations");
    var defaultHeight =$('.entry').css('height'); 
    $('tr').removeClass('fancy-hover', function(){
        console.log("remvoing class");
    });
    console.log("default row height: " + defaultHeight);
    $("tr").hover(function(){
        $(this).animate({height: '50px'},500);
     }, function(){
        $(this).animate({height: defaultHeight},500);
     });
});
