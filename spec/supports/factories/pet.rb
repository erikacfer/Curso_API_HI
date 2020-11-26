require_relative '../models/pet.rb'

FactoryBot.define do
  factory :fact_pet, class: ModelPet do
    id { rand(1..1000) }
    category { attributes_for(:pet_category) }
    name { "#{Faker::Creature::Dog.name}" }
    photoUrls { [''] }
    tags { attributes_for_list(:pet_tags, 1) }
    status { 'available' }

    trait :status_pending do
      status { 'pending' }
    end

    trait :status_sold do
      status { 'sold' }
    end

    factory :fact_pet_pending, traits: [:status_pending]
    factory :fact_pet_sold, traits: [:status_sold]
  end

  factory :pet_category, class: ModelPetCategory do
    id { rand(1..1000) }
    name { "#{Faker::Creature::Dog.breed}" }
  end

  factory :pet_tags, class: ModelPetTags do
    id { rand(1..1000) }
    name { "#{Faker::Verb.base}" }
  end
end
