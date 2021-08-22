# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orders::DisburseJob, type: :job do
  let(:order)  { create(:order) }
  let(:service_stub) { double }

  it 'calls the service' do
    expect(Disbursements::CreateService).to receive(:new)
      .with(order: order)
      .and_return(service_stub)
    expect(service_stub).to receive(:call)

    described_class.perform_now(order.id)
  end
end
