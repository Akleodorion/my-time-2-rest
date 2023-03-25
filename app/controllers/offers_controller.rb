class OffersController < ApplicationController

  def show
  end

  def new
  end

  def create
  end

  def index
    @offers = current_user.nil? ? Offer.all : Offer.excluding_user(current_user.id)
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
