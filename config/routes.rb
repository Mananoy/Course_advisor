Rails.application.routes.draw do
  # following are the route for system function in system controllersd
  root 'system#index'
  post "/system/login", to: "system#login"
  get "/system/login", to: "system#index"
  get "/system/logout", to: "system#logout"

  # following are the route for students in students controller
  get "/system/students", to: "students#dashboard"
  get "/system/students/request_advice", to: "students#advice"
  get "/system/students/request_advice/new_student", to: "students#new_student"
  get "/system/students/request_advice/continue_student", to: "students#continue_student"
  post "/system/students/request_advice/form_submit", to: "students#form_submit"
  post "/system/students/request_advice/result", to: "students#result"
  get "/system/students/request_advice/result", to: "students#history"
  get "/system/students/advice_history", to: "students#history"
  get "/system/students/help", to: "students#help"
  post "/system/students/show", to: "students#show"
  get "/system/students/show", to: "students#show"
  post "/system/students/edit", to: "students#edit"
  get "/system/students/edit", to: "students#edit"
  patch "/system/students/update", to: "students#update"
  put "/system/students/update", to: "students#update"
  patch "/system/students", to: "students#dashboard"
  get "/system/students/enrolments", to: "students#enrolments"

  # following are the route for staffs in staffs controller
  get "/system/staffs", to: "staffs#dashboard"
  get "/system/staffs/current_appointment", to: "staffs#appointment"
  get "/system/staffs/advice_history", to: "staffs#history"
  post "/system/staffs/show_advice", to: "staffs#show"
  get "/system/staffs/show_advice", to: "staffs#show"
  get "/system/staffs/help", to: "staffs#help"
end
