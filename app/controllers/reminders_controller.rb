class RemindersController < ApplicationController
  def show
    @reminder = Reminder.find(params[:id])
  end

  def create
    @reminder = Reminder.new(reminder_params)
    # @reminder.author = current_user
    @reminder.save
    # adapt redirect to @user after merge
    redirect_to @reminder
  end

  def edit
    @reminder = Reminder.find(params[:id])

  end

  private
    def reminder_params
      params.require(:reminder).permit(:text, :send_at)
    end
end
