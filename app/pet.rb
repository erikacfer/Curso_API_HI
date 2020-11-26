# Classes para CRUD de pets que serão utilizadas nos casos de testes

class Pet
  @@uri = "#{ENV['BASE_URI']}/pet"

  def create_pet(body)
    uri = "#{@@uri}"
    response = without_authentication('post', uri, body.to_json)
    # puts response
  end

  def update_pet(body)
    uri = "#{@@uri}"
    response = without_authentication('put', uri, body.to_json)
  end

  def find_pet_status(pet_status)
    uri = "#{@@uri}/findByStatus?status=#{pet_status}"
    response = without_authentication('get', uri)
  end

  def find_pet_id(id)
    uri = "#{@@uri}/"
    response = without_authentication('get', uri)
  end

  def update_pet_data(body)
    uri = "#{@@uri}/"
    response = without_authentication('post', uri, body.to_json)
  end

  def delete_pet(body)
    uri = "#{@@uri}/"
    response = without_authentication('delete', uri, body.to_json)
  end
end
