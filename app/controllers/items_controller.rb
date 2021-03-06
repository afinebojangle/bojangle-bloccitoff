class ItemsController < ApplicationController
  def create
    @list = current_user.list
    @item = Item.new(params.require(:item).permit(:name))
    @item.list = @list
    if @item.save
      flash[:notice] = "A new item was created."
    else
      flash[:error] = "There was an error saving the item. Please try again"
    end
    
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item Complete!"
    else
      flash[:error] = "There was an error completing the task."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end