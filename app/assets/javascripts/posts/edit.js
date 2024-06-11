// 選択した写真のプレビューを表示する 
// 初回読み込み、リロード、ページ切り替えで動くように設定(cf https://qiita.com/hiroyayamamo/items/b258acbaa089d9482c8a)
$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      // ファイルの読み込みが完了した時に実行されるコールバック関数
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      // ファイルの読み込み
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#post_img").change(function(){
    readURL(this);
  });
});
