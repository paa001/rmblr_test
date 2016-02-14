# == Schema Information
#
# Table name: translations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Translation < ActiveRecord::Base
  validates :name, presence: true

  has_many :translation_messages, -> { order(created_at: :desc) }, dependent: :destroy
end
