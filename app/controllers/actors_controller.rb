class ActorsController < ApplicationController
  def index
    @actors = Actor.all.sort_by { |actor| actor.name }
    if params[:search]
      @actors = Actor.search(params[:search])
    else
      @actors = Actor.all.sort_by { |actor| actor.name }
    end
  end

  def show
    @actor = Actor.find( params[:id] )
  end

  def new
    @actor = Actor.new
  end

  def create
    actor = Actor.new( actor_params )

    if actor.save
      redirect_to actors_path
    else
      render 'new'
    end
  end

  def edit
    @actor = Actor.find( params[:id] )
  end

  def update
    @actor = Actor.find( params[:id] )

    if @actor.update_attributes( actor_params )
      redirect_to @actor
    else
      render 'edit'
    end
  end

  def destroy
    @actor = Actor.find( params[:id] )

    @actor.destroy

    redirect_to actors_path
  end

private

  def actor_params
    params.require( :actor ).permit( :name, :age, :country, :bio )
  end
end
