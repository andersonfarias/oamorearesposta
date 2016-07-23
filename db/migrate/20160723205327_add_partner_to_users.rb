class AddPartnerToUsers < ActiveRecord::Migration
    def change
        add_reference :users, :partner, index: true, foreign_key: true
    end
end
