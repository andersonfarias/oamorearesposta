class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.references :department, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
