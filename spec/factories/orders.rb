FactoryBot.define do
  factory :order do
    merchant
    shopper
    amount { SecureRandom.rand }
  end
end
