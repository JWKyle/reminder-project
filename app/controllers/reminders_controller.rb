class RemindersController < ApplicationController

  def index
    @reminders = Reminder.all
    @reminder = Reminder.new

    respond_to do |format|
      format.html
      format.json
    end

  end

  def show
    @reminder = Reminder.find(params[:id])

    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.author_id = 1
    @reminder.save

    respond_to do |f|
      f.html { redirect_to reminders_url }
      f.js
    end
    #
    # if @reminder.save
    #   p "succeeded!"
    #   redirect_to @reminder, notice: 'reminder was successfully created.'
    # else
    #   p "failed!!"
    #   render :new, notice: 'reminder failed.'
    # end
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def update
    @reminder = Reminder.find(params[:id])

    if @reminder.update(params[:reminder].permit(:text, :send_at))
      respond_to do |f|
        f.html { redirect_to reminders_url }
        f.js
      end
      # redirect_to @reminder
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
