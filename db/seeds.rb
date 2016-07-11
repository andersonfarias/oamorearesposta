# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create admin user
# CreateAdminService.new.call

# Create all Brazilian States and Cities
# CreateStatesAndCitiesService.new.call

# Department data migration
# ImportDepartmentService.new.call

# Beneficiary data migration
# ImportBeneficiaryService.new.call

# ClinicalDiary data migration
ImportComunityTreatmentDiaryService.new.call