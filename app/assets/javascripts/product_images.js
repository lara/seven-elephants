var mainImage = document.querySelector('.product-images-full img')
var thumbnails = document.querySelectorAll('.product-image-thumbnails img')
thumbnails.forEach((thumbnail) => {

  thumbnail.addEventListener('click', () => {
    mainImage.src = thumbnail.src
  })
})
