class RollsController < ApplicationController
  before_action :set_roll, only: [:show, :edit, :update, :destroy, :server_check]

  # GET /rolls
  # GET /rolls.json
  def index
    @rolls = Roll.all
  end

  # GET /rolls/1
  # GET /rolls/1.json
  def show
  end

  # GET /rolls/new
  def new
    @roll = Roll.new
  end

  # GET /rolls/1/edit
  def edit
  end

  # POST /rolls
  # POST /rolls.json



  def roll_update
    @server = Server.find(params[:id])  
    @server.rolls.create(
    :name=>Time.now)
    redirect_to :back
  end

  def check_server
    Roll.find(params[:id]).update(
      :status=>1)
    redirect_to :back
  end

  def uncheck_server
    Roll.find(params[:id]).update(
      :status=>0)
    redirect_to :back
  end

  def create
    @roll = Roll.new(roll_params)

    respond_to do |format|
      if @roll.save
        #format.html { redirect_to @roll, notice: 'Roll was successfully created.' }
        format.html { redirect_to rolls_url, notice: 'Roll was successfully created.' }
        format.json { render :show, status: :created, location: @roll }
      else
        format.html { render :new }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rolls/1
  # PATCH/PUT /rolls/1.json
  def update
    respond_to do |format|
      if @roll.update(roll_params)
        #format.html { redirect_to @roll, notice: 'Roll was successfully updated.' }
        format.html { redirect_to :back, notice: 'Roll was successfully updated.' }

        format.json { render :show, status: :ok, location: @roll }
      else
        format.html { render :edit }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rolls/1
  # DELETE /rolls/1.json
  def destroy
    @roll.destroy
    respond_to do |format|
      format.html { redirect_to rolls_url, notice: 'Roll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roll
      @roll = Roll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roll_params
      params.require(:roll).permit(:name, :notes, :status)
    end
end
