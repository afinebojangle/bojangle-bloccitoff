class ItemsController < ApplicationController
  def create
    @list = current_user.list
    @item = Item.new(params.require(:item).permit(:name))
    @item.list = @list
    if @item.save
      flash[:notice] = "A new item was created."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the item. Please try again"
      render :new
    end
  end
  
  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item Complete!"
      redirect_to list_path
    else
      flash[:error] = "There was an error completing the task."
      render list_path
    end
  end
end