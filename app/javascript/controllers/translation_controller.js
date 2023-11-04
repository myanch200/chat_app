import { Controller } from "@hotwired/stimulus"
import { post } from '@rails/request.js'


// Connects to data-controller="translation"
export default class extends Controller {
  static targets = [ "content"]
  static values = {messageId: String}

  buttonLoading(button) {
    button.innerText = "Translating..."
    button.disabled = true
  }

  buttonReset(button) {
    button.innerText = "Translate"
    button.disabled = false
  }

  async translate(event) {
    if(this.element.querySelector('.translation')) {
      this.element.querySelector('.translation').remove()
    }

    this.buttonLoading(event.target)
 

    const response = await post('/translate', {
      body: JSON.stringify({
        content: this.contentTarget.innerText,
        message_id: this.messageIdValue
      })})

    if(!response.ok) {
      console.error(data)
      return
    } 

    const data = await response.text
    let translated = JSON.parse(data).translated
    this.appendTranslation(translated)
    this.buttonReset(event.target)

  }

  appendTranslation(translatedText) {
    const html = `
      <div class="py-3 translation">
        <hr/>
        <p class='pt-2 fade-in'>${translatedText}</p>
      </div>
    `;
    this.contentTarget.insertAdjacentHTML('beforeend', html);
  }
}
