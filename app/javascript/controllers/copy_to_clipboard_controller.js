import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy-to-clipboard"
export default class extends Controller {
  static targets = [ "content", "copyMessage" ]
  connect() {
    console.log('copy to clipboard');
  }

  copy(event) {
    event.preventDefault();

    const source = this.contentTarget.innerText;

    navigator.clipboard.writeText(source).then(() => this.copied());
  }

  copied() {
    if(this.timeout) {
      clearTimeout(this.timeout);
    }

    this.copyMessageTarget.innerText = "Copied!";

    this.timeout = setTimeout(
                    () => { 
                      this.copyMessageTarget.innerText = 'Copy';
                    }, 
                    1500
                  );
  }
}
