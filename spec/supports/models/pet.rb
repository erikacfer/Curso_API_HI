class ModelPet
  attr_accessor :id,
                :category,
                :name,
                :photoUrls,
                :tags,
                :status
end

class ModelPetCategory
  attr_accessor :id, :name
end

class ModelPetTags
  attr_accessor :id, :name
end
