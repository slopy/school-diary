class PaymentDecorator < BaseDecorator
  delegate_all

  def paid
    object.paid_at ? 'Yes' : 'No'
  end

  def paid_at
    object.paid_at ? object.paid_at : '-'
  end
end
