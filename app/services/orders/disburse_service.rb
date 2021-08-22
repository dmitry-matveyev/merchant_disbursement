# frozen_string_literal: true

module Orders
  class DisburseService
    def call
      # TODO: limit it to some datetime threshold in the past
      # if we do not want to ocasionally disburse some old orders
      # whcih were not disbursed for some reason

      Order.not_disbursed.pluck(:id).each do |order_id|
        DisburseJob.perform_later(order_id)
      end
    end
  end
end
