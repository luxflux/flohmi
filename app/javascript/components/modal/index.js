function initializeModals() {
  const modals = document.querySelectorAll('.modal');
  modals.forEach(modal => {
    const closeHandler = modal.querySelector('button.delete');
    if (closeHandler) {
      closeHandler.onclick = event => {
        modal.classList.remove('is-active');
      };
    }
  });
}

window.addEventListener('load', initializeModals);
window.addEventListener('ajax:success', initializeModals);
