import { linkClickSelector } from "@rails/ujs";

const initSendTicketModal = () => {

  // Define modal variables
  const modalName = 'sendTicketModal';

  // AJAX request to edit Modal's inner HTML
  $(`#${modalName}`).on('show.bs.modal', function (event) {
    // NOTA BENE: Bootstrap modal uses ES5 syntax

    const modalTitle = document.querySelector(".modal-title");
    const modalBody = document.querySelector(".modal-body");
    const modalFooter = document.querySelector(".modal-footer");

    const button = $(event.relatedTarget) // Button that triggered the modal

    // Extract info from data-* attributes -- either Order.id or Ticket.id
    // const objectId = button.data('objectId')
    const ticketId = button.data('ticketId')
    const orderId = button.data('orderId')
    const clientId = button.data('clientId')

    // Build url w/ data-attributes
    const url = `/clients/${clientId}/edit`

    // Extract and print inner HTML w/ Ajax
    $.ajax({
      url: url,
      dataType: "html",
      success: function (data) {
        // hack from https://stackoverflow.com/questions/18938180/how-to-get-the-html-of-a-div-on-another-page-with-jquery-ajax/18938994
        // modalBody.innerHTML = 'Hello world!';
        modalTitle.innerText = $(data).find('.js-modal-title')[0].innerText
        modalBody.innerHTML = $(data).find('.js-modal-body')[0].innerHTML;
        modalFooter.remove();
      },
      error: function (e) {
        alert('Error: ' + e);
      }
    });

  });
}

export { initSendTicketModal };
