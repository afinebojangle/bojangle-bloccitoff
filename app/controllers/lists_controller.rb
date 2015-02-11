class ListsController < ApplicationController
  before_action :authenticate_user!

  def show
    @list = current_user.list
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = current_user.build_list(params.require(:list).permit(:title))
    authorize @list
    if @list.save
      flash[:notice] = "A new list was created."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please try again"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    authorize @list
    if @list.update_attributes(params.require(:list).permit(:title))
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please try again."
      render :edit
    end
  end
end
