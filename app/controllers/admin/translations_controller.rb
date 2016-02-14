class Admin::TranslationsController < AdminController
  def index
    @translations = Translation.all
  end

  def new
    @translation = Translation.new
  end

  def create
    @translation = Translation.new(translation_param)
    if @translation.save
      redirect_to admin_translations_path
    else
      render action: 'new'
    end
  end

  def show
    @translation = Translation.find(params[:id])
  end

  private

  def translation_param
    params.require(:translation).permit(:name)
  end
end
