require_relative '../app/pet.rb'

describe 'crud - pet' do
  subject(:pet) { Pet.new }
  let(:obj_pets) { attributes_for(:fact_pet) }
  let(:obj_pets_pending) { attributes_for(:fact_pet_pending) }
  let(:obj_pets_sold) { attributes_for(:fact_pet_sold) }

  context 'create pet' do
    it 'create pet successfully' do
      resultado = pet.create_pet(obj_pets)

      expect(resultado.code).to eq 200
      expect(resultado['category']['id']).to eq(obj_pets[:category][:id])
      expect(resultado['category']['name']).to eq(obj_pets[:category][:name])
      expect(resultado['name']).to eq(obj_pets[:name])
      expect(resultado['photoUrls']).to eq(obj_pets[:photoUrls])
      expect(resultado['tags'][0]['id']).to eq(obj_pets[:tags][0][:id])
      expect(resultado['tags'][0]['name']).to eq(obj_pets[:tags][0][:name])
      expect(resultado['status']).to eq(obj_pets[:status])
    end

    it 'create pet unsuccessfully - missing id' do
    end

    it 'create pet unsuccessfully - missing name' do
    end

    it 'create pet unsuccessfully - missing status' do
    end
  end

  context 'upate pet' do
    it 'upate pet successfully' do
      new_pet = pet.create_pet(obj_pets)
      obj_pets[:id] = new_pet['id']

      obj_pets[:category][:id] = rand(1..100)
      obj_pets[:category][:name] = "#{Faker::Creature::Dog.breed}"
      obj_pets[:name] = "#{Faker::Creature::Dog.name}"
      obj_pets[:photoUrls] = ['https://pets/catioro']
      obj_pets[:tags][0][:id] = rand(1..100)
      obj_pets[:tags][0][:name] = "#{Faker::Verb.base}"
      obj_pets[:status] = 'sold'

      resultado = pet.update_pet(obj_pets)

      expect(resultado.code).to eq(200)
      expect(resultado['category']['id']).to eq(obj_pets[:category][:id])
      expect(resultado['category']['name']).to eq(obj_pets[:category][:name])
      expect(resultado['name']).to eq(obj_pets[:name])
      expect(resultado['photoUrls']).to eq(obj_pets[:photoUrls])
      expect(resultado['tags'][0]['id']).to eq(obj_pets[:tags][0][:id])
      expect(resultado['tags'][0]['name']).to eq(obj_pets[:tags][0][:name])
      expect(resultado['status']).to eq(obj_pets[:status])
    end

    it 'upate pet unsuccessfully - missing id' do
    end

    it 'upate pet unsuccessfully - invalid id' do
    end

    it 'upate pet unsuccessfully - id not found' do
    end
  end

  context 'find pet by status' do
    it 'find pet successfully - available' do
      new_pet = pet.create_pet(obj_pets)
      pet_status = new_pet['status']

      resultado = pet.find_pet_status(pet_status)

      expect(resultado.code).to eq(200)
      status = resultado.all? { |value| value['status'] == 'available' }
      expect(status).to be_truthy
    end

    it 'find pet successfully - pending' do
      new_pet = pet.create_pet(obj_pets_pending)
      pet_status = new_pet['status']

      resultado = pet.find_pet_status(pet_status)

      expect(resultado.code).to eq(200)
      status = resultado.all? { |value| value['status'] == 'pending' }
      expect(status).to be_truthy
    end

    it 'find pet successfully - sold' do
      new_pet = pet.create_pet(obj_pets_sold)
      pet_status = new_pet['status']

      resultado = pet.find_pet_status(pet_status)

      expect(resultado.code).to eq(200)
      status = resultado.all? { |value| value['status'] == 'sold' }
      expect(status).to be_truthy
    end

    it 'find pet unsuccessfully - missing status' do
    end

    it 'find pet unsuccessfully - invalid status' do
    end

    it 'find pet unsuccessfully - status not found' do
    end
  end

  context 'find pet by id' do
    it 'find pet successfully' do
      resultado = pet.create_pet(obj_pets)
      expect(resultado.code).to eq 200
    end

    it 'find pet unsuccessfully - missing id' do
    end

    it 'find pet unsuccessfully - invalid id' do
    end

    it 'find pet unsuccessfully - id not found' do
    end
  end

  context 'upate pet with form data' do
    it 'upate pet successfully' do
      resultado = pet.create_pet(obj_pets)
      expect(resultado.code).to eq 200
    end
  end

  context 'delete pet' do
    it 'delete pet successfully' do
      resultado = pet.create_pet(obj_pets)
      expect(resultado.code).to eq 200
    end

    it 'delete pet unsuccessfully - missing id' do
    end

    it 'delete pet unsuccessfully - invalid id' do
    end

    it 'delete pet unsuccessfully - id not found' do
    end
  end
end
