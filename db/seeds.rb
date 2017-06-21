# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#TypeProduct.create(name: 'Comida rápida')
#TypeProduct.create(name: 'Combo')
#TypeProduct.create(name: 'Promoción')

#----------------Productss--------------------------
#Comidas rápidas
#Product.create(name: 'Hamburguesa 1', description: 'Hamburguesa sencilla', price: 6000, type_product_id: 1)
#Product.create(name: 'Hamburguesa 2', description: 'Hamburguesa con pollo', price: 7000, type_product_id: 1)
#Product.create(name: 'Hamburguesa 3', description: 'Hamburguesa con doble carne', price: 8000, type_product_id: 1)
#Product.create(name: 'Perro caliente 1', description: 'Perro caliente sencillo', price: 4000, type_product_id: 1)
#Product.create(name: 'Perro caliente 2', description: 'Perro caliente con pollo', price: 5000, type_product_id: 1)
#Product.create(name: 'Perro caliente 3', description: 'Perro caliente con doble carne', price: 6000, type_product_id: 1)
#Product.create(name: 'Sandwish 1', description: 'Sandwish sencillo', price: 6500, type_product_id: 1)
#Product.create(name: 'Sandwish 2', description: 'Sandwish con pollo', price: 8500, type_product_id: 1)
#Product.create(name: 'Sandwish 3', description: 'Sandwish mixto', price: 15000, type_product_id: 1)

#Combos
#Product.create(name: 'Combo 1', description: 'Hamburguesa sencilla y perro caliente sin gaseosa', price: 9500, type_product_id: 2)
#Product.create(name: 'Combo 2', description: 'Hamburguesa doble y perro caliente con 1 gaseosa', price: 12500, type_product_id: 2)
#Product.create(name: 'Combo 3', description: 'Hamburguesa mixta y perro caliente con 2 gaseosas', price: 15000, type_product_id: 2)
#Product.create(name: 'Combo 4', description: 'Sandwish sencillo y perro caliente con 2 gaseosas', price: 14000, type_product_id: 2)
#Product.create(name: 'Combo 5', description: 'Sandwish doble y hamburguesa sencilla con 2 gaseosas', price: 17000, type_product_id: 2)
#Product.create(name: 'Combo 6', description: 'Sandwish mixto y hamburguesa doble carne con 2 gaseosas', price: 17000, type_product_id: 2)

#Promociones
#Product.create(name: 'Promoción 1', description: 'Hamburguesa sencilla con gaseosa', price: 7000, type_product_id: 3)
#Product.create(name: 'Promoción 1', description: 'Hamburguesa sencilla con gaseosa y papas', price: 8500, type_product_id: 3)

#----------------Ingredients--------------------------
#Ingredient.create(name: 'Carne de hamburguesa', description: 'Carne de res para hamburguesa')
#Ingredient.create(name: 'Pollo', description: 'Pollo desmechado')
#Ingredient.create(name: 'Tocino', description: 'Tocino asado')
#Ingredient.create(name: 'Cebolla', description: 'Cebolla cabezona')
#Ingredient.create(name: 'Ajo', description: 'Ajo molido')
#Ingredient.create(name: 'Carne de res', description: 'Carne de res asada')
#Ingredient.create(name: 'Carne de cerdo', description: 'Carne de cerdo asada')
#Ingredient.create(name: 'Pollo frito', description: 'Pollo frito desmechado')
#Ingredient.create(name: 'Tomate', description: 'Tomate para sandwich')
#Ingredient.create(name: 'Lechuga', description: 'Lechuga para sandwish')
#Ingredient.create(name: 'Salsa de tomate', description: 'Salsa complementaria')
#Ingredient.create(name: 'Salsa de ajo', description: 'Salsa complementaria')
#Ingredient.create(name: 'Salsa rosada', description: 'Salsa complementaria')
#Table.create(name: "Domicilio", id: 0)