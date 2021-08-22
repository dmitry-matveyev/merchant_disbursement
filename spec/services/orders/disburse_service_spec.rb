# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orders::DisburseService, type: :service do
  let(:service_class) { described_class.new }
  let!(:disbursed_order) { create(:order, :disbursed) }
  let!(:order) { create(:order) }

  it { expect { service_class.call }.to have_enqueued_job(Orders::DisburseJob) }

  describe 'not disbursed order' do
    it { expect { service_class.call }.to have_enqueued_job.with(order.id) }
  end

  describe 'disbursed order' do
    it { expect { service_class.call }.not_to have_enqueued_job.with(disbursed_order.id) }
  end
end
