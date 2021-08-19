require 'rails_helper'

RSpec.describe Disbursements::CreateService, type: :service do
  let(:order)  { create(:order) }
  let(:service_class) { described_class.new(order: order) }

  it { expect { service_class.call }.to change { order.reload.disbursed_at } }
end
