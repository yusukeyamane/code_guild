$('.js-replace-no-image').error ->
  $(this).attr
    src: '/images/no-image.jpg'
    alt: 'no image'
