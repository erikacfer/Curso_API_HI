require 'httparty'

class Pet
  @@uri = "#{ENV['BASE_URI']}/pet"

  def create_pet(body)
    # body = {
    #   "id": 1111,
    #   "category": {
    #     "id": 0,
    #     "name": 'string',
    #   },
    #   "name": 'doggie',
    #   "photoUrls": [
    #     'string',
    #   ],
    #   "tags": [
    #     {
    #       "id": 0,
    #       "name": 'string',
    #     },
    #   ],
    #   "status": 'available',
    # }

    #response = HTTParty.post('https://petstore.swagger.io/v2/pet', :headers => { 'accept': 'application/json', 'content-type': 'application/json' }, :body => body.to_json)

    uri = "#{@@uri}"
    response = without_authentication('post', uri, body.to_json)
    # puts response
  end

  def update_pet(body)
    uri = "#{@@uri}"
    response = without_authentication('put', uri, body.to_json, 'application/json')
  end

  def find_pet_status(body)
    uri = "#{@@uri}/iddddd"
    response = without_authentication('get', uri, body.to_json, 'application/json')
  end

  def find_pet_id(body)
    uri = "#{@@uri}/xxxxx"
    response = without_authentication('get', uri, body.to_json, 'application/json')
  end

  def update_pet_data(body)
    uri = "#{@@uri}/xxxxx"
    response = without_authentication('post', uri, body.to_json, 'application/json')
  end

  def delete_pet(body)
    uri = "#{ENV['BASE_URI']}"
    response = without_authentication('delete', uri, body.to_json, 'application/json')
  end
end
