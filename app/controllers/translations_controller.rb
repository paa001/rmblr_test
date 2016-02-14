class TranslationsController < ApplicationController
  def index
    @translations = Translation.all
  end

  def show
    @translation = Translation.find(params[:id])
  end
end
