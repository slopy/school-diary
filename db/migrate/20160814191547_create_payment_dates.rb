class CreatePaymentDates < ActiveRecord::Migration
  def change
    create_table :payment_dates do |t|
      t.date :scheduled_at
    end
  end
end
