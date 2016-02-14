class Admin::TranslationMessagesController < AdminController
  def create
    translation = Translation.find(params[:translation_id])

    translation.translation_messages.create(translation_message_param)

    redirect_to admin_translation_path(translation)
  end

  private

  def translation_message_param
    params.require(:translation_message).permit(:body).merge(user: current_user)
  end
end
