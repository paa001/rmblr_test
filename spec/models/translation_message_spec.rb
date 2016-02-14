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

require 'rails_helper'

describe TranslationMessage do
  subject { create :translation_message }
  it { is_expected.to be_valid }

  describe :object do
    it 'should send info in "translation" channel' do
      translation_message = create :translation_message

      expected_result = {
        body: translation_message.body,
        user: translation_message.user.name,
        translation: translation_message.translation.id
      }

      RealtimeTranslationController.channel('/translation', nil) do |channel_o|
        channel_o.subscribe do |subscribe_o|
          expect(subscribe_o.message).to eq(expected_result)
        end
      end
    end
  end
end
