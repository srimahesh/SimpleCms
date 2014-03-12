class PagesController < ApplicationController
  
  layout "admin"
  
  # Read
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  # Update
  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to({:action => 'show', :id => @page.id})
    else
      flash[:notice] = "Page did not get updated"
      redirect_to('index')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    flash[:notice] = "Page destroyed successfully"
    redirect_to('index')
  end


   # Create
  def new
    @page = Page.new({:name => "default"})
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to({:action => 'show', :id => @page.id})
    else
      render('edit')
    end
  end
  private 
    def page_params
      params.require(:page).permit(:page_id, :name, :position, :visible, :content_type, :content)
    end
end
