class AddIsActiveToDepartments < ActiveRecord::Migration[4.2]
    def change
        add_column :departments, :is_active, :boolean, default: true
    end
end
