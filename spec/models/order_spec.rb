# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:disbursed_order) { create(:order, :disbursed) }
  let(:order) { create(:order) }

  it { expect(Order.not_disbursed).to eq([order]) }
end
