# frozen_string_literal: true

module Disbursements
  class CreateService
    FEE_PERCENTS = [
      [0.01, ->(order) { order.amount < 50 }],
      [0.0095, ->(order) { order.amount >= 50 && order.amount <= 300 }],
      [0.0085, ->(order) { order.amount > 300 }]
    ].freeze

    def initialize(order:)
      self.order = order
    end

    def call
      # NOTE: to be run in job with retries on exception
      order.update!(fee_amount: fee_amount, disbursed_at: Time.current)
    end

    private

    attr_accessor :order

    def fee_amount
      (order.amount * fee_percent).round(2)
    end

    def fee_percent
      FEE_PERCENTS.each { |percent, validator| return percent if validator.call(order) }
    end
  end
end
