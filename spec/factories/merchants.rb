FactoryBot.define do
  factory :merchant do
    name { SecureRandom.hex }
    email { |record| "#{record.name}@example.net" }
    cif { SecureRandom.rand.to_s }
  end
end
