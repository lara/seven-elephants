var thumbnails = document.querySelectorAll('.product-image-thumbnails img')
thumbnails.forEach((thumbnail) => {
  var imageIndex = thumbnail.id.split('-')[2]

  thumbnail.addEventListener('click', () => {
    window.scrollTo(0, imagePosition(imageIndex))
  })
})

function imagePosition (imageIndex) {
  return document.getElementById(`image-${imageIndex}`).getBoundingClientRect().y
}
