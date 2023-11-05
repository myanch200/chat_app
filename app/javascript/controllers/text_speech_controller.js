import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="text-speech"
export default class extends Controller {
  static targets = [ "content" ]
  connect() {

  }

  speak() {
    const utterance = new SpeechSynthesisUtterance(this.contentTarget.innerText);

    utterance.lang = 'en-US';
    
    // cancel any previous utterances
    speechSynthesis.cancel();
    speechSynthesis.speak(utterance);
  }
}
