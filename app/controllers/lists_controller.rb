class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :add_movies]

  def index
    @lists = List.all
  end

  def new
    @movies = Movie.all
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
        redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movies = Movie.all
    @bookmark = Bookmark.new
    @list_movies = @list.movies
  end

  def destroy
  end

  def add_movies
    @list.movies << Movie.where(id: params[:lists][:movies])
    redirect_to @list
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, movie_ids: [])
  end
end
