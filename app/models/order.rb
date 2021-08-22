# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  scope :not_disbursed, -> { where(disbursed_at: nil) }

  def disbursed?
    disbursed_at.present?
  end
end
