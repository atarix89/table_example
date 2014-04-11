class Data1sController < ApplicationController
  def edit
    @id = params[:id]
    @data = Data1.find(@id)
#    render :nothing => true 
    
    respond_to do |format|
      format.js { render :js => " $('#edid').html('#{@id}')

                                  document.getElementById('in1').value = '#{@data.col1}'
                                  document.getElementById('in2').value = '#{@data.col2}'
                                  document.getElementById('in3').value = '#{@data.col3}'
                                  document.getElementById('in4').value = '#{@data.col4}'
                                  document.getElementById('in5').value = '#{@data.col5}'
                                  document.getElementById('in6').value = '#{@data.col6}'  
                                  document.getElementById('in7').value = '#{@data.col7}'"}
    end
  end
  def new    
    respond_to do |format|
      format.js { render :js => " $('#edid').html('new')
                                  $('#ed1').html('Enter value')
                                  $('#ed2').html('Enter value')
                                  $('#ed3').html('Enter value')
                                  $('#ed4').html('Enter value')
                                  $('#ed5').html('Enter value')
                                  $('#ed6').html('Enter value')
                                  $('#ed7').html('Enter value') " }
    end
  end
  
  def destroy
    @data = Data1.find(params[:id])
    @data.destroy
  
    respond_to do |format|
      format.js {render :js => "location.reload()"}
    end 
  end
end
