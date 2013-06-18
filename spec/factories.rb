FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "Person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

	factory :admin do
  		admin true
  	end
  end

  factory :micropost do
  	content "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
    title "Lorem ipsum"
  	user
  end

  factory :postimage do
    content "image 1"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images','places', 'image.jpg')) }
    micropost
  end
end
