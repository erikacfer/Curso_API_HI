require_relative '../app/pet.rb'
require 'httparty'

describe 'crud - pet' do
  subject(:pet) { Pet.new }

  context 'create pet' do
    it 'create pet successfully' do

      #body = attributes_for(:fact_pet).to_json
      #puts body[:name]
      resultado = pet.create_pet
      expect(resultado.code).to eq 200
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
    end

    it 'upate pet unsuccessfully - missing id' do
    end

    it 'upate pet unsuccessfully - invalid id' do
    end

    it 'upate pet unsuccessfully - id not found' do
    end
  end

  context 'find pet by status' do
    it 'find pet successfully' do
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
    end
  end

  context 'delete pet' do
    it 'delete pet successfully' do
    end

    it 'delete pet unsuccessfully - missing id' do
    end

    it 'delete pet unsuccessfully - invalid id' do
    end

    it 'delete pet unsuccessfully - id not found' do
    end
  end
end
