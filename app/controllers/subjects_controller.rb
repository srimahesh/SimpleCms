class SubjectsController < ApplicationController
  
  # layout false
  layout "admin"
  
  def index
    @subjects = Subject.sorted   # Subjects.order("position ASC")
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
    
    else
      # If save fails, redisplay the form so user can fix the issues
      render('new')
    end  
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    # subject.destroy
    flash[:notice] = "Subject '#{subject.name}'' destroyed successfully"
    redirect_to(:action => 'index')


  end


  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
    # If save succeeds, redirect to the index action
    flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # If save fails, redisplay the form so user can fix the issues
      render('edit')
    end 
  end




  private

    def subject_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible)
    end
end
