import Quill from 'quill';

import 'quill/dist/quill.snow.css';
import './styles.scss';

function loadEditor() {
  const editors = document.querySelectorAll('.wysiwyg');
  editors.forEach(editor => {
    const form = editor.closest('form');
    const wysiwygTarget = form.querySelector('.wysiwyg-target');

    const quill = new Quill(editor, {
      modules: {
        toolbar: [
          [{ header: [1, 2, false] }],
          ['bold', 'italic', 'underline'],
          [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        ]
      },
      placeholder: 'Schreibe einen tollen Text ...',
      theme: 'snow',
    });

    quill.root.innerHTML = wysiwygTarget.value;

    form.onsubmit = () => {
      wysiwygTarget.value = quill.root.innerHTML;
    };
  });
}

window.addEventListener("turbolinks:load", loadEditor);
