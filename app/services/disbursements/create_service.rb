module Disbursements
  class CreateService
    def initialize(order:)
      self.order = order
    end

    def call
      order.update(disbursed_at: Time.current)
    end

    private

    attr_accessor :order
  end
end
