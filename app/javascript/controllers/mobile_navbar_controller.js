import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  toggleMenu () {
    document.querySelector('.mobile-navbar').classList.toggle('hidden')
  }
}