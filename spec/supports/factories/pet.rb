require_relative '../models/pet.rb'

FactoryBot.define do
  factory :fact_pet, class: ModelPet do
    id { SecureRandom.hex(3) }
    category { '' }
    name { "#{Faker::Creature::Dog.name}" }
    photoUrls { '' }
    tags { '' }
    status { 'available' }

    # trait :category do
    #   id { 0 }
    #   name { "#{Faker::Creature::Dog.breed}" }
    # end

    # trait :tags do
    #   id { 0 }
    #   name { "#{Faker::Verb.base}" }
    # end

    # factory :pet_complete, traits: [:category, :tags]
  end
end

# {
#     "id": 0,
#     "category": {
#       "id": 0,
#       "name": "string"
#     },
#     "name": "doggie",
#     "photoUrls": [
#       "string"
#     ],
#     "tags": [
#       {
#         "id": 0,
#         "name": "string"
#       }
#     ],
#     "status": "available"
#   }
