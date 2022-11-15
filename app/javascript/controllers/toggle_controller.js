import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  connect() {
  }

  showMenu(event) {
    document.body.classList.toggle("sb-sidenav-toggled")
  }
}
