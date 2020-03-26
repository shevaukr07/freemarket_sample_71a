
$(document).on('turbolinks:load', function () {
  $(function () {

    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="edit_btn">編集</label>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    if (window.location.href.match(/\/items\/\d+\/edit/)) {
      var prevContent = $('.label-content').prev();
      $('.preview-box').each(function (index, box) {
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function (index, box) {
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 5) {
        $('.label-content').hide();
      }
    }


    $(document).on('change', '.hidden-field', function () {
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $('.label-box').attr({ id: `label-box--${id}`, for: `item_item_images_attributes_${id}_image` });
      var file = this.files[0];
      var reader = new FileReader();
      $('.hidden-btn').show();
      reader.readAsDataURL(file);
      reader.onload = function () {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 5) {
          $('.label-content').hide();
        }

        if ($(`#item_item_images_attributes_${id}_destroy`)) {
          $(`#item_item_images_attributes_${id}__destroy`).prop('checked', false);
        }

        if (count < 5) {
          $('.label-box').attr({ id: `label-box--${count}`, for: `item_item_images_attributes_${count}_image` });
        }
      }
    });

    $(document).on('click', '.delete-box', function () {
      var count = $('.preview-box').length;
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();

      if (id == 0) {
        $('.hidden-btn').hide();
      }

      if ($(`#item_item_images_attributes_${id}__destroy`).length == 0) {
        $(`#item_item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 4) {
          $('.label-content').show();
        }
        if (id < 5) {
          $('.label-box').attr({ id: `label-box--${id}`, for: `item_item_images_attributes_${id}_image` });
        }
      } else {
        $(`#item_item_images_attributes_${id}__destroy`).prop('checked', true);
        if (count == 4) {
          $('.label-content').show();
        }
        var count = $('.preview-box').length;
        if (count == 4) {
          $('.label-content').show();
        }
        if (id < 5) {
          $('.label-box').attr({ id: `label-box--${id}`, for: `item_item_images_attributes_${id}_image` });
        }
      }
    });
    if ($('.preview-box').length == 0) {
      $('.hidden-btn').hide();
    }
  });
});
