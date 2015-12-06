FactoryGirl.define do
	factory :note do
		association :user
		title { Faker::Lorem.sentence }
		content { Faker::Lorem.sentences(3).join(' ') }
		share false

		trait :public do
			share true
		end

		factory :note_with_comments do
			transient do
				comments_count 5
			end

			after(:create) do |note, evaluator|
				FactoryGirl.create_list(:comment, evaluator.comments_count, note: note)
			end
		end
	end
end