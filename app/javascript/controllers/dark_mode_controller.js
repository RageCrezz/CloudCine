import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["icon"];

  connect() {
    console.log("Dark mode controller connected!");

    // Initialize dark mode state from localStorage
    const isDarkMode = localStorage.getItem("darkMode") === "true";
    this.applyDarkMode(isDarkMode);
  }

  toggle() {
    const html = document.documentElement;
    const isDarkMode = html.getAttribute("data-theme") === "dark";

    // Toggle the `data-theme` attribute
    if (isDarkMode) {
      html.setAttribute("data-theme", "light");
    } else {
      html.setAttribute("data-theme", "dark");
    }

    // Save the state in localStorage
    localStorage.setItem("darkMode", !isDarkMode);

    // Update the icon
    this.updateIcon(!isDarkMode);
  }

  applyDarkMode(isDarkMode) {
    const html = document.documentElement;

    // Set the correct `data-theme` attribute
    if (isDarkMode) {
      html.setAttribute("data-theme", "dark");
    } else {
      html.setAttribute("data-theme", "light");
    }

    // Update the icon
    this.updateIcon(isDarkMode);
  }

  updateIcon(isDarkMode) {
    this.iconTarget.innerHTML = isDarkMode
      ? '<i class="fas fa-sun"></i>' // Sun icon for light mode
      : '<i class="fas fa-moon"></i>'; // Moon icon for dark mode
  }
}
