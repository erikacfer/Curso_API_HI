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
