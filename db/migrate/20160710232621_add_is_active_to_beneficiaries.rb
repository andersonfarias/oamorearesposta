class AddIsActiveToBeneficiaries < ActiveRecord::Migration
      def change
          add_column :beneficiaries, :is_active, :boolean, :default => true
      end
end
