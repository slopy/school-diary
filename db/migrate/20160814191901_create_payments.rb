class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :student, index: true, foreign_key: true
      t.references :payment_date, index: true, foreign_key: true
      t.date :paid_at
    end
  end
end
