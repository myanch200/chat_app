import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="text-speech"
export default class extends Controller {
  static targets = [ "content" ]
  connect() {

  }

  speak(event) {
    console.log(this.contentTarget.innerText);

    const utterance = new SpeechSynthesisUtterance(this.contentTarget.innerText);

    utterance.lang = 'en-US';

    speechSynthesis.speak(utterance);
  }
}
