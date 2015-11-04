class SubjectsController < ApplicationController

  layout "admin"

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
       flash[:notice] = "Subject created successfully"
       redirect_to(:action => 'index')
    else
      # if save fails, redisplay the form user can fix problem
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    #Update the object
    if @subject.update_attributes(subject_params)
    #if update successful, redirect to the index action
       flash[:notice] = "Subject updated successfully"
       redirect_to(:action => 'show', :id => @subject.id)
    else
      # if save fails, redisplay the form user can fix problem
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    #we only need a local variable for the subject here
    #since we're not displaying a template, we don't need
    #an instance variable
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
  # same as using "params[:subject]", except that it:
  # - raises an error if :subject is not present
  # - allows listed attributes to be mass-assigned
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
