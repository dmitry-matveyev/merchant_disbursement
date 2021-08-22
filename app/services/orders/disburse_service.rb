# frozen_string_literal: true

module Orders
  class DisburseService
    def call
      # TODO: limit it to some datetime threshold in the past
      # if we do not want to ocasionally disburse some old orders
      # whcih were not disbursed for some reason

      Order.not_disbursed.each do |order|
        Disbursements::CreateService.new(order: order).call
      end
    end
  end
end
