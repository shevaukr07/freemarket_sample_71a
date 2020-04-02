$(document).on('turbolinks:load', function () {
  $(function () {

    function buildHTML(image) {
      var html =
        `
        <div class="prev-content">
          <img src="${image}", alt="preview", class="prev-image">
        </div>
        `
      return html;
    };

    $(document).on('change', '.hidden-file', function () {
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function () {
        var image = this.result;
        console.log(this);
        if ($('.prev-content').length == 0) {
          var html = buildHTML(image);
          $('.photo-icon').hide();
          $('.prev-contents').prepend(html);
        } else {
          $('.prev-content .prev-image').attr({ src: image });
        }
      };
    });
  });
});
