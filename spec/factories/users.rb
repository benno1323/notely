FactoryBot.define do
	factory :user do
		sequence(:email) { |n| "johndoe#{n}@example.com"}
		password "12345678"
		password_confirmation "12345678"
	end
end