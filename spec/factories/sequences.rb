FactoryGirl.define do
  sequence :string do |n|
    "string-#{n}"
  end

  sequence :email do |n|
    "#{n}-#{Faker::Internet.email}"
  end

  sequence :text do |n|
    Faker::Lorem.paragraph
  end

  sequence :confirmation_token, aliases: [:uid] do |n|
    SecureRandom.urlsafe_base64
  end

  sequence :permalink do |n|
    SecureRandom.urlsafe_base64(32)
  end

  sequence :personal_quality do |n|
    {text: "quality-#{n}"}
  end

  sequence :token do |n|
    SecureRandom.urlsafe_base64
  end
end
