# Classes para CRUD de pets que serão utilizadas nos casos de testes

class Pet
  @@uri = "#{ENV['BASE_URI']}/pet"

  def create_pet(body = nil)
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

  def find_pet_id(pet_id)
    uri = "#{@@uri}/#{pet_id}"
    response = without_authentication('get', uri)
  end

  def update_pet_form(body, pet_id)
    uri = "#{@@uri}/#{pet_id}"
    response = without_authentication('post', uri, body.to_json)
  end

  def delete_pet(pet_id)
    uri = "#{@@uri}/#{pet_id}"
    response = without_authentication('delete', uri)
  end
end
