FactoryBot.define do
	factory :comment do
		association :user
		association :note
		content { Faker::Lorem.sentence }
	end
end