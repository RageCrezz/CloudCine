import { Application } from "@hotwired/stimulus";
import SecurityQuestionsController from "./controllers/security_questions_controller";
import "../stylesheets/application.scss";

const application = Application.start();
application.register("security-questions", SecurityQuestionsController);
