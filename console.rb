require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


  film1 = Film.new({
    'title' => 'Black Panther',
    'price' => 4
  })

  film1.save()


  film2 = Film.new({
    'title' => 'Spider-Man: Far From Home',
    'price' => 6
  })

  film2.save()

  film3 = Film.new({
    'title' => 'Avengers: Infinity War',
    'price' => 8
  })

  film3.save()

  customer1 = Customer.new({'name' => 'Steve', 'funds' => 100})
  customer2 = Customer.new({'name' => 'Tony', 'funds' => 800})
  customer3 = Customer.new({'name' => 'Bruce', 'funds' => 60})
  customer4 = Customer.new({'name' => 'Peter', 'funds' => 30})
  customer5 = Customer.new({'name' => 'Thor', 'funds' => 50})

  customer1.save()
  customer2.save()
  customer3.save()
  customer4.save()
  customer5.save()

  ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
  ticket2 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
  ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
  ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film3.id})
  ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film1.id})
  ticket6 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film2.id})
  ticket7 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film2.id})
  ticket8 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})

  ticket1.save()
  ticket2.save()
  ticket3.save()
  ticket4.save()
  ticket5.save()
  ticket6.save()
  ticket7.save()
  ticket8.save()

  binding.pry
  nil
