class Product_stack

	attr_accessor :stocked_products

	def initialize(mars_bar, polos, cola, diet_cola, snickers, wine_gums, chewing_gum)
		@stocked_products = { "mars bar" 		=> mars_bar,
												 	"polos"				=> polos,
												 	"cola"				=> cola,
												 	"diet cola"		=> diet_cola,
												 	"snickers"		=> snickers,
												 	"wine gums"		=> wine_gums,
												 	"chewing gum" => chewing_gum}


	end

end