class MoviesController < ApplicationController
  def index
    @movies = Movie.all.sort_by { |movie| movie.year }
  end

  def show
    @movie = Movie.find( params[:id] )
  end

  def new
    @movie = Movie.new
    @movie.actor_id = params[:actor_id]
  end

  def create
    movie = Movie.new( movie_params )
    if movie.save
      redirect_to actor_path( movie.actor_id )
    else
      render new_movie_path
    end
  end

  def edit
    @movie = Movie.find( params[:id] )
  end

  def update
    @movie = Movie.find( params[:id] )

    if @movie.update_attributes( movie_params )
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find( params[:id] )

    actor_id = @movie.actor_id

    @movie.destroy

    redirect_to actor_path( actor_id )
  end

  private

  def movie_params
    params.require( :movie ).permit( :title, :year, :cover, :plot, :actor_id, genre_ids: [] )
  end
end
