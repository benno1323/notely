FactoryGirl.define do
	factory :note do
		association :user
		title "My Title"
		content "My content"
		share false
	end
end