document.addEventListener('DOMContentLoaded', function() {
  if ( document.getElementById('message_image')){
    const ImageList = document.getElementById('image-list')

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')

      // 表示する画像を生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)
      blobImage.setAttribute('class', "image-size")
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage)
      ImageList.appendChild(imageElement)
    }

    document.getElementById('message_image').addEventListener('change', (e) => {
      for (let i = 0, len = e.target.files.length; i < len; i++) {
        const file = e.target.files[i];
        const blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      }
    });
  }
});
