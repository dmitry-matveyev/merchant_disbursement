# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Disbursements::CreateService, type: :service do
  let(:order)  { create(:order) }
  let(:service_class) { described_class.new(order: order) }

  # TODO: test that it is set to current time
  it { expect { service_class.call }.to change { order.reload.disbursed? }.to(true) }

  TEST_CASES = [[0.5, 49.99],          # 0.01% for orders lesser than 50 Eur
                [0.48, 50],            # 0.0095% for orders for 50-300 Eur
                [2.85, 300],           # 0.0095% for orders for 50-300 Eur
                [2.55, 300.01]].freeze # 0.0085% for orders more than 300 Eur

  TEST_CASES.each do |fee_amount, order_amount|
    context "when order has #{order_amount} amount" do
      let(:order) { create(:order, amount: order_amount) }

      it { expect { service_class.call }.to change { order.reload.fee_amount }.to(fee_amount) }
    end
  end

  context 'when object can not be persisted' do
    xit 'should raise error on update'
  end
end
