class ActorsController < ApplicationController
<<<<<<< HEAD
=======
  before_action :find_actor, only: [:edit, :show, :update, :destroy, :add_movie, :remove_movie]

>>>>>>> b6f563e4e6ddbbc2addd3b2b5d4ed2beb35a8b05
  def index
    @actors = Actor.all
  end

  def create
<<<<<<< HEAD
    @actor = Actor.new actor_params
    if @actor.save

      redirect_to actors_path
    else
      render :new
    end
=======
    binding.pry
    Actor.create actor_params
    redirect_to actors_path
>>>>>>> b6f563e4e6ddbbc2addd3b2b5d4ed2beb35a8b05
  end

  def new
    @actor = Actor.new
  end

  def edit
<<<<<<< HEAD
    @actor = Actor.find params[:id]
  end

  def show
    @actor = Actor.find params[:id]
    @movies = Movie.all
  end

  def update
    @actor = Actor.find params[:id]
    if @actor.update_attributes actor_params
      redirect_to actor_path(@actor)
    else
      render :edit
    end
  end

  def destroy
    actor = Actor.find params[:id]
    actor.destroy
    redirect_to actors_path
  end

def add_movie
  movie = Movie.find(params[:movie_id])
  actor = Actor.find(params[:id])
  movie.actors << actor
  redirect_to movie_path(movie)
end
def remove_movie
  movie = Movie.find(params[:movie_id])
  actor = Actor.find(params[:id])
  movie.actors.delete(actor)
  redirect_to movie_path(movie)
end
  
  private
  def actor_params
    params.require(:actor).permit(:name)
=======
  end

  def show
    @movies = Movie.all - @actor.movies
  end

  def update
    @actor.update_attributes actor_params
    redirect_to @actor
  end

  def destroy
    @actor.destroy
    redirect_to actors_path
  end

  def add_movie
    @actor = Actor.find(params[:id])
    movie = Movie.find(movie_params[:id])
    unless @actor.movies.include? movie
      @actor.movies << movie
    end
    redirect_to @actor
  end

  def remove_movie
    movie = Movie.find(params[:movie_id])
    @actor.movies.delete(movie)
    redirect_to @actor
  end

  private
  def movie_params
    params.require(:movie).permit(:id, :title, :year)
  end

  def actor_params
    params.require(:actor).permit(:id, :name)
  end

  def find_actor
    @actor = Actor.find(params[:id])
>>>>>>> b6f563e4e6ddbbc2addd3b2b5d4ed2beb35a8b05
  end
end
