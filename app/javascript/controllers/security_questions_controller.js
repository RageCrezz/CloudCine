import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["question1", "question2"];

  connect() {
    this.updateOptions();

    console.log("Hello stimulus ")
    console.log("Hello stimulus ")

    this.question1Target.addEventListener("change", () => this.updateOptions());
    this.question2Target.addEventListener("change", () => this.updateOptions());
  }

  updateOptions() {
    const value1 = this.question1Target.value;
    const value2 = this.question2Target.value;

    [...this.question1Target.options].forEach((option) => (option.disabled = false));
    [...this.question2Target.options].forEach((option) => (option.disabled = false));

    if (value1) {
      [...this.question2Target.options].forEach((option) => {
        if (option.value === value1) option.disabled = true;
      });
    }

    if (value2) {
      [...this.question1Target.options].forEach((option) => {
        if (option.value === value2) option.disabled = true;
      });
    }
  }
}
