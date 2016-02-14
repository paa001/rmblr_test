# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

describe User do
  subject { create :user }
  it { is_expected.to be_valid }

  describe :object do
    it 'should respond to :name' do
      user = create :user
      expect(user.name).to eq("#{user.last_name} #{user.first_name}")
    end
  end
end
