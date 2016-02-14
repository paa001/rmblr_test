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

FactoryGirl.define do
  factory :translation_message do
    sequence(:body) { |i| "message_#{i}" }
    translation { create :translation }
    user { create :user }
  end
end
