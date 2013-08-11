class StudentsController < ApplicationController
def index
    @leagues = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student }
    end
  end

end
