
$(document).on('turbolinks:load', function () {
$(function() {
  $('.category_list .header-nav-link').on("click",function(e){
    e.preventDefault(e);
    if ($('.parents_list .display-none').is(':visible')) {
      $('.parents_list .display-none').slideUp();
      // $('.children_list').slideUp();
      // $('.grand_children_list').slideUp();
      $(".child_category").remove();//一旦出ている子カテゴリ消します！
      $(".grand_child_category").remove();//
    } else {
      $('.parents_list .display-none').slideDown();
    };
  }); 

  // $('.parents_list').on('mouseout',function(){
  //   $('.parents_list').slideUp();
  // });

  // $('.parents_list').on('mouseout',function(){
  //   $('.parents_list').slideUp();
  // });

  // $('.parents_list').on("hover",function(){
  //   $('.parents_list').slideUp();
  // });
  // $('.close-category').on("click",function(){
  //   $('.grand_children_list').slideUp();
  // });
  // $('.close-category').on("click",function(){
  //   $('.children_list').slideUp();
  // });
  
  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/categorys/${child.id}">${child.name}</a>`;
    return html;
  }

  $(".parent_category").on("mouseover", function() {
    var id = this.id//どのリンクにマウスが乗ってるのか取得します
    // console.log(id);
    $(".now-selected-red").removeClass("now-selected-red")//赤色のcssのためです
    $('#' + id).addClass("now-selected-red");//赤色のcssのためです
    $(".child_category").remove();//一旦出ている子カテゴリ消します！
    $(".grand_child_category").remove();//孫、てめえもだ！
    $.ajax({
      type: 'GET',
      url: '/categorys/new',//とりあえずここでは、newアクションに飛ばしてます
      data: {parent_id: id},//どの親の要素かを送ります params[:parent_id]で送られる
      dataType: 'json'
    })
    .done(function(children) {
      // console.log(children);
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        console.log();
        $(".children_list").append(html);//リストに追加します
      })
    });
  });

    // 孫カテゴリを追加する処理です 基本的に子要素と同じです！
  function buildGrandChildHTML(child){
    var html2 =`<a class="grand_child_category" id="${child.id}"
              href="/categorys/${child.id}">${child.name}</a>`;
    return html2;
  }

  $(document).on("mouseover", ".child_category", function () {//子カテゴリーのリストは動的に追加されたHTMLのため
    var id = this.id
    $(".now-selected-gray").removeClass("now-selected-gray");//灰色のcssのため
    $('#' + id).addClass("now-selected-gray");//灰色のcssのため
    $.ajax({
      type: 'GET',
      url: '/categorys/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {
        var html2 = buildGrandChildHTML(child);
        $(".grand_children_list").append(html2);
      })
      $(document).on("mouseover", ".child_category", function () {
        $(".grand_child_category").remove();
      });
    });
  });  
});
});