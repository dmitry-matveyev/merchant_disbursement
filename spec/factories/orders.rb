# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    merchant
    shopper
    amount { SecureRandom.rand }
  end
end
