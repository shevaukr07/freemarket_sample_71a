$(document).on('turbolinks:load', function () {
  $(function () {

    function appendOption(category) {
      var html =
        `
        <option value="${category.id}" data-category="${category.id}">${category.name}</option>
        `
      return html;
    };
    function appendChildrenBox(insertHTML) {
      childSelectHtml =
        `
          <div class='cattegory-contents__inner children-contents'>
            <select class="form-content--select" id="child_category" name="item[category_id]">
              <option value="---" data-category="---">選択してください</option>
              ${insertHTML}
            <select>
          </div>
        `
      $('.category-contents').append(childSelectHtml);
    };

    function appendGrandchildrenBox(insertHTML) {
      grandchildSelectHtml =
        `
          <div class='cattegory-contents__inner grandchildren-contents'>
            <select class="form-content--select" id="grandchild_category" name="item[category_id]">
              <option value="---" data-category="---">選択してください</option>
              ${insertHTML}
            <select>
          </div>
        `
      $('.category-contents').append(grandchildSelectHtml);
    };

    $(document).on('change', '#item_category_id', function () {
      var ele = document.getElementById('item_category_id').value;
      if (ele != 0) {
        $.ajax({
          url: '/items/get_category_children',
          type: 'GET',
          data: { parent_id: ele },
          dataType: 'json'
        })
          .done(function (children) {
            $('.children-contents').remove();
            $('.grandchildren-contents').remove();
            var insertHTML = '';
            children.forEach(function (child) {
              insertHTML += appendOption(child);
            });
            appendChildrenBox(insertHTML);
            $('#item_category_id').attr({ name: '' });
          })
          .fail(function () {
            alert('カテゴリー取得に失敗しました');
          })
      } else {
        $('.children-contents').remove();
        $('.grandchildren-contents').remove();
      }
    });
    $(document).on('change', '#child_category', function () {
      var childID = $('#child_category option:selected').data('category');
      if (childID != 0) {
        $.ajax({
          url: '/items/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childID },
          dataType: 'json'
        })
          .done(function (grandchildren) {
            if (grandchildren != 0) {
              $('.grandchildren-contents').remove();
              var insertHTML = '';
              grandchildren.forEach(function (grandchildren) {
                insertHTML += appendOption(grandchildren);
              });
              appendGrandchildrenBox(insertHTML);
              $('#child_category').attr({ name: '' });
            }
          })
          .fail(function () {
            alert('カテゴリー取得に失敗しました');
          })
      } else {
        $('.grandchildren-contents').remove();
      }
    })
  });
});
