function initializeModals() {
  const modals = document.querySelectorAll('.modal');

  modals.forEach(modal => {
    const closeHandler = modal.querySelector('button.delete') || modal.querySelector('button.modal-close');
    if (closeHandler) {
      closeHandler.onclick = event => {
        modal.classList.remove('is-active');
      };
    }

    const opener = modal.parentNode.querySelector('.modal-trigger');
    if(opener) {
      opener.onclick = event => {
        modal.classList.add('is-active');
      };
    }
  });
}

window.addEventListener('load', initializeModals);
window.addEventListener('ajax:success', initializeModals);
