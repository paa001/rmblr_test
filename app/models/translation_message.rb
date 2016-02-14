# == Schema Information
#
# Table name: translation_messages
#
#  id             :integer          not null, primary key
#  translation_id :integer
#  user_id        :integer          not null
#  body           :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TranslationMessage < ActiveRecord::Base
  belongs_to :translation
  belongs_to :user
  after_create :send_message

  validates :body, :translation, :user, presence: true

  scope :with_users, -> { includes(:user) }

  private

  def send_message
    RealtimeTranslationController.publish '/translation', body: body, user: user.name, translation: translation.id
  end
end
