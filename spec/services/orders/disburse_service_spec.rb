# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orders::DisburseService, type: :service do
  let(:service_class) { described_class.new }
  let(:disbursed_order) { create(:order, disbursed_at: Time.current) }
  let(:order) { create(:order) }

  describe 'not disbursed order' do
    it { expect { service_class.call }.to change { order.reload.disbursed_at } }
  end

  describe 'disbursed order' do
    it { expect { service_class.call }.not_to change { disbursed_order.reload.disbursed_at } }
  end
end
