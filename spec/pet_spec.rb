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

    xit 'create pet unsuccessfully - invalid input' do # teste falhou por causa da gem hi_httparty
      resultado = pet.create_pet()
      expect(resultado.code).to eq 405
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

    xit 'upate pet unsuccessfully - Invalid ID supplied' do
    end

    xit 'upate pet unsuccessfully - Pet not found' do
    end

    xit 'upate pet unsuccessfully - Validation exception' do
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

    it 'find pet unsuccessfully - Invalid status value' do
      resultado = pet.find_pet_status('invalid')
      expect(resultado.code).to eq(200)
      expect(resultado.any?).to be_falsey
    end
  end

  context 'find pet by id' do
    it 'find pet successfully' do
      new_pet = pet.create_pet(obj_pets)
      pet_id = new_pet['id']

      resultado = pet.find_pet_id(pet_id)
      search_id = resultado['id']

      expect(resultado.code).to eq(200)
      expect(search_id).to eq(pet_id)
    end

    xit 'find pet unsuccessfully - 	Invalid ID supplied' do
    end

    xit 'find pet unsuccessfully - Pet not found' do
    end
  end

  context 'upate pet with form data' do
    it 'upate pet successfully' do
      obj_pets_form = "name:#{Faker::Creature::Dog.name} status:sold"
      puts obj_pets_form
      new_pet = pet.create_pet(obj_pets)
      pet_id = new_pet['id']

      resultado = pet.update_pet_form(obj_pets_form, pet_id)
      puts resultado

      expect(resultado.code).to eq(200)
      expect(resultado['category']['id']).to eq(obj_pets[:category][:id])
      expect(resultado['category']['name']).to eq(obj_pets[:category][:name])
      expect(resultado['name']).to eq(obj_pets_form[:name])
      expect(resultado['photoUrls']).to eq(obj_pets[:photoUrls])
      expect(resultado['tags'][0]['id']).to eq(obj_pets[:tags][0][:id])
      expect(resultado['tags'][0]['name']).to eq(obj_pets[:tags][0][:name])
      expect(resultado['status']).to eq(obj_pets_form[:status])
    end

    xit 'upate pet unsuccessfully - Invalid input' do
    end
  end

  context 'delete pet' do
    it 'delete pet successfully' do # teste com lógica duvidosa
      new_pet = pet.create_pet(obj_pets)
      pet_id = new_pet['id']
      pet_status = new_pet['status']
      pet_name = new_pet['name']

      resultado = pet.delete_pet(pet_id)
      expect(resultado.code).to eq(200)

      resultado = pet.find_pet_status(pet_status)
      search = resultado.any? { |value| value['name'] == pet_name }
      expect(search).to be_falsey
    end

    xit 'delete pet unsuccessfully - Invalid ID supplied' do
    end

    xit 'delete pet unsuccessfully - Pet not found' do
    end
  end
end
