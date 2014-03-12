class DemoController < ApplicationController
  
  # layout false
  # Action when in context with a controller, uses a layout too
  def index
  	# render(:template => 'demo/hello')
  	# render('index')


  end

  def hello
  	# render('index')
  	@array = [1, 2, 3, 4, 5]
  	@id = params[:id]
  	@page = params['page'].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end


  def lynda
  	redirect_to('http://lynda.com')
  end


  def text_helpers
    
  end
end
