import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["question1", "question2"];

  connect() {
    if (!this.hasQuestion1Target || !this.hasQuestion2Target) {
      console.error("Missing question targets for security-question controller");
      return;
    }
    this.updateDisabledOptions();
    console.log("Security-question controller connected!");
  }

  updateDisabledOptions() {
    if (!this.hasQuestion1Target || !this.hasQuestion2Target) return;

    const question1Value = this.question1Target.value;
    const question2Value = this.question2Target.value;

    this.toggleOptions(this.question2Target, question1Value);
    this.toggleOptions(this.question1Target, question2Value);
  }

  toggleOptions(selectElement, selectedValue) {
    Array.from(selectElement.options).forEach((option) => {
      option.disabled = option.value === selectedValue;
    });
  }

  updateQuestion1() {
    this.updateDisabledOptions();
  }

  updateQuestion2() {
    this.updateDisabledOptions();
  }
}
