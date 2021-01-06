import Vue from 'vue/dist/vue.esm'

// プロフィール写真 のプレビュー
document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#icon-img',
    methods: {
      btnClick() {
       const preview = document.getElementById('fileInputButton');
       const file = document.querySelector('input[type=file]').files[0];
       const reader = new FileReader();

       reader.addEventListener("load", function () {
         // 画像ファイルを base64 文字列に変換
         preview.src = reader.result;
       }, false);

       if (file) {
         reader.readAsDataURL(file);
       }
     }
    }
  })
})
