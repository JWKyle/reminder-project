class RemindersController < ApplicationController
  def show
    @reminder = Reminder.find(params[:id])
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.author_id = 1
    if @reminder.save
      p "succeeded!"
      redirect_to @reminder, notice: 'reminder was successfully created.'
    else
      p "failed!!"
      render :new, notice: 'reminder failed.'
    end
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def update
    @reminder = Reminder.find(params[:id])

    if @reminder.update(params[:reminder].permit(:text, :send_at))
      redirect_to @reminder
    else
      render 'edit'
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy

    redirect_to root_path
  end

  private
    def reminder_params
      params.require(:reminder).permit(:text, :send_at)
    end
end
