class VisitorsController < ApplicationController

  #  data = Data1.create({id: 10, col1: 'awg4',col2: '15eyy2',col3: '1seys58',col4: '350',col5: '23et34',col6: '1seu83',col7: '673',col8: '332',col9: '655'}) 

  def connect_db1
    ActiveRecord::Base.establish_connection :data1
    $db = Data1
    @data = $db.new
    @data_grid = initialize_grid($db)
    $grid = "grid1"
    render :nothing => true
  end
  
  def connect_db2
    ActiveRecord::Base.establish_connection :data2
    $db = Data2
    @data = $db.new
    @data_grid = initialize_grid($db)
    $grid = "grid2"
    render :nothing => true   
  end
  
  def connect_db3
    ActiveRecord::Base.establish_connection :data3
    $db = Data3
    @data = $db.new
    @data_grid = initialize_grid($db)
    $grid = "grid3"
    render :nothing => true
  end
  
#  def render_grid
#    @data_grid = initialize_grid(Data1)
#    render :partial => 'grid'
#  end

  def entry_new
    @data = $db.new
    @data.col1 = params[:in1]
    @data.col2 = params[:in2]
    @data.col3 = params[:in3]
    @data.col4 = params[:in4]
    @data.col5 = params[:in5]
    @data.col6 = params[:in6]
    @data.col7 = params[:in7]   
    @data.save
    respond_to do |format|
      format.js {render :js => "location.reload()"}	 # not the best way, .load() is smarter, but it crashes wice_grid
    end
  end
  
  def entry_edit
    @id = params[:id].to_i
    @data = $db.find(@id)    
    @data.col1 = params[:in1]
    @data.col2 = params[:in2]
    @data.col3 = params[:in3]
    @data.col4 = params[:in4]
    @data.col5 = params[:in5]
    @data.col6 = params[:in6]
    @data.col7 = params[:in7]   
    @data.save
    
    respond_to do |format|
      format.js {render :js => "location.reload()"}
    end
#    respond_to do |format|
#      format.js {render :js => "$('#grid').load('/render_grid')"}
#    end
  end
    
  def new
    if defined? $db then 
      @data_grid = initialize_grid($db)
    else
    ActiveRecord::Base.establish_connection :data1
      $db = Data1
      @data_grid = initialize_grid($db)
      $grid = "grid1"
    end      
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end

end
