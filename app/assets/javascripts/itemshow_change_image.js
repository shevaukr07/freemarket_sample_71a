$(function(){
  $('.item__left__subpic img').click(function(){
   var $thisImg = $(this).attr('src');
   var $thisAlt = $(this).attr('alt');
   $('.item__left__mainpic img').attr({src:$thisImg,alt:$thisAlt});
  });
 });