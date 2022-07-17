class AddColumnsToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :request_sent_at, :datetime
    add_column :payments, :approved_at, :datetime
  end
end
