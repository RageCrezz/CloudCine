// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DarkModeController from "./dark_mode_controller"
application.register("dark-mode", DarkModeController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SecurityQuestionController from "./security_question_controller"
application.register("security-question", SecurityQuestionController)

import SidebarController from "./sidebar_controller"
application.register("sidebar", SidebarController)
