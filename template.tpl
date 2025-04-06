const log = require('logToConsole');
const dataLayer = require('dataLayer');
const injectScript = require('injectScript');

function listenToCF7Interactions() {
  const formSelector = 'form.wpcf7-form';
  const fields = document.querySelectorAll(`${formSelector} input, ${formSelector} textarea, ${formSelector} select`);

  fields.forEach(field => {
    ['focus', 'change', 'input'].forEach(evtType => {
      field.addEventListener(evtType, (evt) => {
        dataLayer.push({
          event: 'cf7_field_interaction',
          cf7_event_type: evtType,
          field_name: field.name || null,
          field_type: field.type || field.tagName.toLowerCase(),
        });
      });
    });
  });

  log('CF7 Interaction Listener initialized');
}

listenToCF7Interactions();
