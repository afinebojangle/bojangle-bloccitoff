class ItemsController < ApplicationController
  def create
    @list = current_user.list
    @item = @list.build(params.require(:item).permit(:name))
    if @item.save
      flash[:notice] = "A new item was created."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the item. Please try again"
      render :new
    end
  end
end