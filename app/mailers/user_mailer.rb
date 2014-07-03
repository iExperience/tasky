class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def task_updated_email(task)
    @task = task
    @user = task.assignee

    mail(to: @user.email, subject: "Task Updated")
  end
end
