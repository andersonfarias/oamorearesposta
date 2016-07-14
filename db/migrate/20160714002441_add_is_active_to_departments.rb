class AddIsActiveToDepartments < ActiveRecord::Migration
    def change
        add_column :departments, :is_active, :boolean, default: true
    end
end
