class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :data
      t.integer :amount_paid, :default => 0
      t.datetime :accepted_at
      t.string :rejected_because
      t.references :request, :user
      t.timestamps
    end

    add_index :responses, :request_id
  end
end