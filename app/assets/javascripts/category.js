$(document).on('turbolinks:load', function () {
  $(function () {
    function buildForm(n) {
      var form =
        `
        < f.collection_select :category_id, Category.where(ancestry: ${n}), : id, : name, { include_blank: '選択してください' }, class: 'form-content--select' >
        `
    }

    $(document).on('change', '#item_category_id', function () {
      var ele = document.getElementById("#item_category_id");

    })
  });
});

.i - n - categories__inner__category
  .teams
  % h3.i - n - team
カテゴリー
  % p.hissu
必須
  = f.collection_select : category_id, Category.where(ancestry: nil), : id, : name, { include_blank: '選択してください' }, class: 'form-content--select'
