class StudentsController < ApplicationController
	
	def index
    	@students = Student.all

    	respond_to do |format|
      	format.html # index.html.erb
      	format.json { render json: @student }
    	end
  	end

  	def new
      	@student = Student.new
      	@users = User.all

      	respond_to do |format|
      	format.html # new.html.erb
      	format.json { render json: @student }
      	end
  	end

  	def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @league }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

end
