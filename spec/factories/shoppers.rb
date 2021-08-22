# frozen_string_literal: true

FactoryBot.define do
  factory :shopper do
    name { SecureRandom.hex }
    email { |record| "#{record.name}@example.net" }
    nif { SecureRandom.rand.to_s }
  end
end
