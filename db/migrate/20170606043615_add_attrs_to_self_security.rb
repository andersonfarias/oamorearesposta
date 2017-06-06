class AddAttrsToSelfSecurity < ActiveRecord::Migration
  def change
    add_column :self_securities, :estar_preso, :string
    add_column :self_securities, :cometer_crime, :string
    add_column :self_securities, :relacao_companheiro_perigoso, :string
    add_column :self_securities, :relacao_sob_efeito_droga, :string
    add_column :self_securities, :relacao_lugar_risco, :string
  end
end
