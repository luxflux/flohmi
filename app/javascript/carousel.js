import bulmaCarousel from 'bulma-carousel';

function loadCarousels() {
  bulmaCarousel.attach('.carousel', {
    slidesToScroll: 1,
    slidesToShow: 4
  });
}

window.addEventListener("turbolinks:load", loadCarousels);
