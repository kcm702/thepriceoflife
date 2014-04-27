class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

      if @item.save
        redirect_to @item, notice: 'Item was successfully created.' 
      else
        render action: 'new' 
      end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
      if @item.update(item_params)
        redirect_to @item, notice: 'Item was successfully updated.' 
      else
        render action: 'edit' 
      end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
      redirect_to items_url 
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:product, :description, :price, :date, :image)
    end

end
