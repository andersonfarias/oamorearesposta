# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Create all Brazilian States
State.destroy_all
State.create(name: "Acre",                acronym: "AC")
State.create(name: "Alagoas",             acronym: "AL")
State.create(name: "Amapá",               acronym: "AP")
State.create(name: "Amazonas",            acronym: "AM")
State.create(name: "Bahia",               acronym: "BA")
State.create(name: "Ceará",               acronym: "CE")
State.create(name: "Distrito Federal",    acronym: "DF")
State.create(name: "Espírito Santo",      acronym: "ES")
State.create(name: "Goiás",               acronym: "GO")
State.create(name: "Maranhão",            acronym: "MA")
State.create(name: "Mato Grosso",         acronym: "MT")
State.create(name: "Mato Grosso do Sul",  acronym: "MS")
State.create(name: "Minas Gerais",        acronym: "MG")
State.create(name: "Pará",                acronym: "PA")
State.create(name: "Paraíba",             acronym: "PB")
State.create(name: "Paraná",              acronym: "PR")
State.create(name: "Pernambuco",          acronym: "PE")
State.create(name: "Piauí",               acronym: "PI")
State.create(name: "Rio de Janeiro",      acronym: "RJ")
State.create(name: "Rio Grande do Norte", acronym: "RN")
State.create(name: "Rio Grande do Sul",   acronym: "RS")
State.create(name: "Rondônia",            acronym: "RO")
State.create(name: "Roraima",             acronym: "RR")
State.create(name: "Santa Catarina",      acronym: "SC")
State.create(name: "São Paulo",           acronym: "SP")
State.create(name: "Sergipe",             acronym: "SE")
State.create(name: "Tocantins",           acronym: "TO")
