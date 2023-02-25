class AddAttrsToJob < ActiveRecord::Migration[4.2]
  def change
    add_column :jobs, :mantem_se_com_dinheiro_ilegal, :string
    add_column :jobs, :nao_tem_officio_ou_habilidades, :string
    add_column :jobs, :traficar_drogas, :string
  end
end
