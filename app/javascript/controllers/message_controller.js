import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element);
    this.element.scrollTop = this.element.scrollHeight;
  }

  resetForm() {
    this.element.reset();
  }
}