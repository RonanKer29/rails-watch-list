class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.includes(:movies).find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "Object successfully created"
      redirect_to list_path(@list)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
