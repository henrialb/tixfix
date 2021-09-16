import { linkClickSelector } from "@rails/ujs";

const initSendTicketModal = () => {

  // Define modal variables
  const modal = document.querySelector('#sendTicketModal')
  const modalTitle = document.querySelector(".modal-title");
  const modalBody = document.querySelector(".modal-body");

  console.log(modal)
  console.log(modalTitle)
  console.log(modalBody)


  // AJAX request to edit Modal's inner HTML
  $(modal).on('show.bs.modal', function (event) {
    // NOTA BENE: Bootstrap modal uses ES5 syntax
    event.preventDefault();

    const button = $(event.relatedTarget) // Button that triggered the modal
    const objectId = button.data('ticketId') // Extract info from data-* attributes
    const url = `tickets/${objectId}` // Build url w/ data-attributes

    console.log(url)
    // Extract tickets/:id inner HTML w/ Ajax
    $.ajax({
      url: url,
      dataType: "html",
      success: function (data) {
        // hack from https://stackoverflow.com/questions/18938180/how-to-get-the-html-of-a-div-on-another-page-with-jquery-ajax/18938994
        modalBody.innerHTML = $(data).find('.pdf-body')[0].innerHTML;
        modalTitle.innerText = $(data).find('.js-title')[0].innerText
      },
      error: function (e) {
        alert('Error: ' + e);
      }
    });
  });
}

export { initSendTicketModal };
