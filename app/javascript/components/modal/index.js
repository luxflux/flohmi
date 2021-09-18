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

  document.querySelectorAll('form[data-remote="true"]').forEach(form => {
    form.addEventListener('ajax:complete', initializeModals);
  });
}

window.addEventListener('turbolinks:load', initializeModals);
window.addEventListener('ajax:complete', initializeModals);
