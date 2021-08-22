# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    merchant
    shopper
    amount { SecureRandom.rand }

    trait :disbursed do
      disbursed_at { Time.current }
    end
  end
end
