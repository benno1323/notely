FactoryGirl.define do
	factory :comment do
		association :user
		association :note
		content "My comment"
	end
end