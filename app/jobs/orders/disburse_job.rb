# frozen_string_literal: true

module Orders
  class DisburseJob < ApplicationJob
    queue_as :default

    def perform(order_id)
      order = Order.find order_id
      Disbursements::CreateService.new(order: order).call
    end
  end
end
