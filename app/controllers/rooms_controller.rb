class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:search, :show]
  before_action :set_room, only: [:show, :update, :destroy]


  def search
    @rooms = Room.where("address LIKE ? AND description LIKE ?",
                "%#{params[:rooms_search][:area]}%", "%#{params[:rooms_search][:keyword]}%")

    @rooms = Room.all if params[:rooms_search][:area] == nil && params[:rooms_search][:keyword] == nil
  end

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = current_user.rooms.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @reservation = Reservation.new
    @reservation.room = @room
    @reservation.user = current_user
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.maker = current_user

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: '部屋が登録されました。' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: '部屋が更新されました。' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:user_id, :new_room_img, :name, :description, :price, :address)
    end
end
