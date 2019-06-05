# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationRecord.transaction do 
  Cat.destroy_all

  Cat.create!(
    birth_date: '2011/02/13',
    color: 'grey',
    name: 'Nyanta',
    sex: 'M',
    description: 'RPG cat'
  )

  Cat.create!(
    birth_date: '2013/07/03',
    color: 'blue',
    name: 'Ryan',
    sex: 'M',
    description: 'ronil genocider'
  )

  Cat.create!(
    birth_date: '2015/02/01',
    color: 'red',
    name: 'girlkyat',
    sex: 'F',
    description: 'very fast cat'
  )
end