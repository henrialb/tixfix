// SOURCE CODE ==> https://github.com/gorails-screencasts/dynamic-nested-forms-with-stimulusjs/blob/master/app/javascript/controllers/nested_form_controller.js

import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["links", "template"]

  connect() {
    this.wrapperClass = this.data.get("wrapperClass") || "nested-fields"
    this.removeLabels()
  }

  addField(event) {
    event.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.linksTarget.insertAdjacentHTML('beforebegin', content)
    this.removeLabels()
  }

  removeField (event) {
    event.preventDefault()
    let wrapper = event.target.closest("." + this.wrapperClass)
    // New records are simply removed from the page
    if (wrapper.dataset.newRecord == "true") {
      wrapper.remove()
    // Existing records are hidden and flagged for deletion
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = 1
      wrapper.style.display = 'none'
    }
  }

  removeLabels () {
    const rows = Array.from(document.querySelectorAll(".form-row"))
    rows.shift()
    rows.forEach((row) => { row.querySelectorAll("label").forEach((label) => label.remove()) })
  }
}
