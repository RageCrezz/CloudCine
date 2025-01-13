import { Application } from "@hotwired/stimulus";
import SecurityQuestionController from "./controllers/security_question_controller";
import DarkModeController from "./controllers/dark_mode_controller";
import SidebarController from "./controllers/sidebar_controller";

const application = Application.start();

application.register("security-question", SecurityQuestionController);
application.register("dark-mode", DarkModeController);
application.register("sidebar", SidebarController);
