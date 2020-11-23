class Pet
  def create_pet(body)
    uri = "https://petstore.swagger.io/#/pet/addPet"
  end

  def update_pet(body)
    uri = "https://petstore.swagger.io/#/pet/updatePet"
  end

  def find_pet_status(body)
    uri = "https://petstore.swagger.io/#/pet/findPetsByStatus"
  end

  def find_pet_id(body)
    uri = "https://petstore.swagger.io/#/pet/findPetsByStatus"
  end

  def update_pet_data(body)
    uri = "https://petstore.swagger.io/#/pet/updatePetWithForm"
  end

  def delete_pet(body)
    uri = "https://petstore.swagger.io/#/pet/deletePet"
  end
end
