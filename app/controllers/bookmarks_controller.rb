class BookmarksController < ApplicationController

  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path, notice: 'Bookmark was successfully destroyed.'
  end

  private

  def set_list
    @list = List.find_by(id: params[:list_id])
    if @list.nil?
      redirect_to lists_path, alert: 'List not found.'
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
