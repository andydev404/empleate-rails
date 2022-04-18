import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="job"
export default class extends Controller {
  connect() {
    console.log(this.element)
  }

  redirect_to_jobs_with_search_params(event) {
    event.preventDefault()
    const url_params = new URLSearchParams()
    const province_slug = this.element.querySelector('#province_province_id').value
    const search_term = this.element.querySelector('#search_term').value

    if (province_slug) {
      url_params.append('province', province_slug)
    }

    if (search_term) {
      url_params.append('search_term', search_term)
    }

    window.location.href = `/ofertas-empleo?${url_params.toString()}`
  }
}
