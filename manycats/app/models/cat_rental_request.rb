# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  STATUS = %w(PENDING DENIED APPROVED)
  validates :cat_id, :start_date, :end_date, :status
  validates :status, inclusion: { in: STATUS, message: "not valid" }

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest
  end
end
