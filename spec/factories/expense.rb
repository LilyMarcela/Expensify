FactoryBot.define do
    factory :expense do 
        concept Faker::Pokemon.name
        amount 25000
        association :category, factory: :category
        
        association :user, factory: :user


    end

end