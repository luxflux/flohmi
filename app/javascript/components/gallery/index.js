import './styles.scss';

function setupGallery(container) {
  const firstSmallImage = container.querySelector('.gallery__preview-image');
  const zoomedImage = container.querySelector('.gallery__zoomed-image');

  zoomedImage.style.backgroundImage = `url('${firstSmallImage.dataset.fullVersion}')`;

  container.addEventListener('click', (event) => {
    const element = event.target;

    if (element.classList.contains('gallery__preview-image')) {
      zoomedImage.style.backgroundImage = `url('${element.dataset.fullVersion}')`;
    }
  });

  zoomedImage.addEventListener('mouseenter', function () {
    this.style.backgroundSize = '250%';
  }, false);

  zoomedImage.addEventListener('mousemove', function(event) {

    // getBoundingClientReact gives us various information about the position of the element.
    const dimensions = this.getBoundingClientRect();

    // Calculate the position of the cursor inside the element (in pixels).
    const x = event.clientX - dimensions.left;
    const y = event.clientY - dimensions.top;

    // Calculate the position of the cursor as a percentage of the total size of the element.
    const xpercent = Math.round(100 / (dimensions.width / x));
    const ypercent = Math.round(100 / (dimensions.height / y));

    // Update the background position of the image.
    this.style.backgroundPosition = `${xpercent}% ${ypercent}%`;

  }, false);

  zoomedImage.addEventListener('mouseleave', function() {
    this.style.backgroundSize = 'cover';
    this.style.backgroundPosition = 'center';
  }, false);
}

function loadGalleries() {
  const galleries = document.querySelectorAll(".gallery");
  galleries.forEach(gallery => {
    setupGallery(gallery);
  });
}

window.addEventListener("turbolinks:load", loadGalleries);
