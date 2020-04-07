$(document).on('turbolinks:load', function () {
  $(function () {
    $('.header-nav-link.brand').on("click", function (e) {
      e.preventDefault(e);
      if ($('.brand-lists').is(':visible')) {
        $('.brand-lists').slideUp();
      } else {
        $('.brand-lists').slideDown();
      };
    });
  });
});
