class SubjectsController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    #instaniate a new subject object using form params
    @subject = Subject.new (subject_params)
    #save the new subject object
    if @subject.save
      #if save successful, redirect to the index action
       redirect_to(:action => 'index')
    else
      # if save fails, redisplay the form user can fix problem
      render('new')
    end
  end

  def edit
  end

  def delete
  end

  private
  # same as using "params[:subject]", except that it:
  # - raises an error if :subject is not present
  # - allowa listed attributes to be mass-assigned
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
