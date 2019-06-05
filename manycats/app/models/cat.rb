# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  require 'action_view'
  require 'action_view/helpers'
  include ActionView::Helpers::DateHelper

  COLORS = %w(black white grey red blue green)
  SEX = %w(M F)
  validates :birth_date, :name, :sex, :description, :color, presence: true
  validates :color, inclusion: { in: COLORS, message: "has to be black, white, grey,red, blue, or green" }
  validates :sex, inclusion: { in: SEX, message: "has to be M or F" }
  validate :valid_birth_date

  has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    now = Date.today
    year = now.year - birth_date.year
  end

  def valid_birth_date
    errors[:birth_date] << "is not valid" if birth_date.nil? || birth_date.year > 2019
  end
end
