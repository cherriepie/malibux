class RollCallsController < ApplicationController
  before_action :set_roll_call, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  # GET /roll_calls
  # GET /roll_calls.json
  def index
    #@roll_calls = RollCall.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @roll_calls = RollCall.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)

    #@products = Product.order(sort_column + " " + sort_direction)


  end

  # GET /roll_calls/1
  # GET /roll_calls/1.json
  def show    
    @results = @roll_call.rolls.all
    
    respond_to do |format|
      format.html
      format.csv {send_data @results.to_csv, filename: "#{@roll_call.name}.csv"}
    end
  end

  # GET /roll_calls/new
  def new
    @roll_call = RollCall.new
  end

  # GET /roll_calls/1/edit
  def edit
  end

  # POST /roll_calls
  # POST /roll_calls.json

  def init_roll
    @name = "Backup Check " + Time.now.strftime("%Y_%m_%d_%A") 
    @roll_call = RollCall.create(:name=>@name)
    Server.all.each do |s|
      @roll = @roll_call.rolls.create(:name=>Time.now, :server=>s, :server_name =>s.name, :client_name=>s.client.name)
    end
    redirect_to @roll_call
  end


  def create
    @roll_call = RollCall.new(roll_call_params)

    respond_to do |format|
      if @roll_call.save
        format.html { redirect_to @roll_call, notice: 'Roll call was successfully created.' }
        format.json { render :show, status: :created, location: @roll_call }
      else
        format.html { render :new }
        format.json { render json: @roll_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roll_calls/1
  # PATCH/PUT /roll_calls/1.json
  def update
    respond_to do |format|
      if @roll_call.update(roll_call_params)
        format.html { redirect_to @roll_call, notice: 'Roll call was successfully updated.' }
        format.json { render :show, status: :ok, location: @roll_call }
      else
        format.html { render :edit }
        format.json { render json: @roll_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roll_calls/1
  # DELETE /roll_calls/1.json
  def destroy
    @roll_call.destroy
    respond_to do |format|
      format.html { redirect_to roll_calls_url, notice: 'Roll call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roll_call
      @roll_call = RollCall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roll_call_params
      params[:roll_call]
    end

    def sort_column
      RollCall.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
