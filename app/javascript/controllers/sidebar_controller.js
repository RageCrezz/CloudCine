import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sidebar"];

  toggle() {
    const sidebar = this.sidebarTarget || document.querySelector("[data-sidebar-target='sidebar']");
    if (sidebar) {
      sidebar.classList.toggle("off");
      sidebar.classList.toggle("on");
    } else {
      console.error("Sidebar target not found.");
    }
  }
}
