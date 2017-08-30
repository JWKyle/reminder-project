class RemindersController < ApplicationController
  def show
    @reminder = Reminder.find(params[:id])
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.save
    # adapt redirect to @user after merge
    redirect_to @reminder
  end

  private
    def reminder_params
      params.require(:reminder).permit(:text, :send_at)
    end
end
