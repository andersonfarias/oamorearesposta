class ImportDepartmentService
	def call
		Department.destroy_all
		Department.create(id: 1, name: "Sede Administrativa", 							 description: "09398193000155\r\nConjunto Murilo Rezende, 07, Quadra A\r\nIlhotas, Teresina , PI \r\n64014450\r\n(86) 32178334 \r\nfrater.amores@yahoo.com.br\r\nseg/sex - 08h00-17h00")
		Department.create(id: 2, name: "Núcleo de Escuta Comunitária", 					 description: "Rua São Lourenço\r\nIlhotas,  Teresina, PI\r\n64015540\r\n(86) 32178334\r\nfrater.amores@yahoo.com.br\r\n2a. a 6a. 8h às 12h")
		Department.create(id: 3, name: "Núcleo de Formação e Capacitação", 				 description: "09398193000155\r\nRua  São Lourenço\r\nIlhotas, Teresina, PI\r\n64015340\r\n(86) 98061997\r\nfrater.amores@yahoo.com.br\r\n2a. a 6a. 14h às 21h")
		Department.create(id: 4, name: "Núcleo de Cuidados com Crianças e Adolescentes", description: "09398193000155\r\nConjunto Murilo Rezende, Casa 7 - A, Quadra A\r\nIlhotas, Teresina, PI \r\n64014450\r\n(86) 99869578\r\nritaf.lisboa@gmail.com\r\n3a. e 4a. de 19h às 21h, Neste Núcleo são oferecidos vários Programas.")
	end
end