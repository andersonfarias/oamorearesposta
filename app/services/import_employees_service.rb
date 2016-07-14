class ImportEmployeesService
  USERS = {"Rita Lisboa" => "ritaf.lisboa@gmail.com",
			 "Mantovani Lopes de Oliveira" => "thormlo51@gmail.com",
			 "Thais Andrade" => "thais.hepa.ufrgs@gmail.com",
       "Billy Heverton da Silva Meneses" => "tutlle007@gmail.com"}
  def call
    USERS.each do |nome, email|
      user = User.find_or_create_by!(email: email) do |user|
  			puts 'CREATING EMPLOYEE USER: ' << nome
  			user.person = Person.create( first_name: nome.split(" ", 2)[0], last_name: nome.split(" ", 2)[1], email: email )
  			user.password = "changeme"
  			user.password_confirmation = "changeme"
        user.role = 5
        puts "CREATED EMPOYEE USER: #{nome} WITH EMAIL: #{email}"
  		end
    end

  end
end
