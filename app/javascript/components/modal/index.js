function initializeModals() {
  const modals = document.querySelectorAll('.modal');

  modals.forEach(modal => {
    const closeHandlers = modal.querySelectorAll('a.delete, button.modal-close, button.form-cancel');
    closeHandlers.forEach(closeHandler => {
      closeHandler.onclick = event => {
        event.preventDefault();
        modal.classList.remove('is-active');
      };
    });

    const opener = modal.parentNode.querySelector('.modal-trigger');
    if(opener) {
      opener.onclick = event => {
        event.preventDefault();
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
