# == Schema Information
#
# Table name: translations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :translation do
    sequence(:name) { |i| "translation_#{i}" }
  end
end
