require 'faker'

Broker.seed :id, 1.upto(6).map { |n| {id: n, name: Faker::Name.name} }
