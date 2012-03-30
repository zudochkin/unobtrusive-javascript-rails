class ItemsController < ApplicationController
  before_filter do
    @items = Item.all
    @item = Item.new
  end

  def index
  end

  def new
    render :action => 'index'
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = "Successfully created item."
      @items = Item.all
    end
  end

  def edit
    @item = Item.find(params[:id])
    @items = Item.all
    #render :action => 'index'
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "Successfully updated item."
    end
    @items = Item.all
    render :action => 'create'
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Successfully destroyed item."
    #redirect_to items_url
    @items = Item.all
  end
end
