class AddIsActiveToBeneficiaries < ActiveRecord::Migration[4.2]
      def change
          add_column :beneficiaries, :is_active, :boolean, :default => true
      end
end
