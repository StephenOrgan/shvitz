class SessionsController < ApplicationController


def new
      	@student = Student.find(params[:student_id])
        @session = Session.new
        @user = current_user
        @users = User.all

      	respond_to do |format|
      	format.html # new.html.erb
      	format.json { render json: @session }
      	end
  	end

  	def create
    @student = Student.find(params[:student_id])
    @session = Session.new(params[:session])
    
    @user = current_user
        @users = User.all

    respond_to do |format|
      if @session.save
        format.html { redirect_to @student, notice: 'Session was successfully created.' }
        format.json { render json: @session, status: :created, location: @session }
      else
        format.html { render action: "new" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end


end
