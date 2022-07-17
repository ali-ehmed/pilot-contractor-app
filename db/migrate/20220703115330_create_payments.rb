class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.decimal :amount
      t.string :currency
      t.text :description

      t.timestamps
    end
  end
end
