FactoryGirl.define do
  factory :post do
    title { FFaker::BaconIpsum.phrase[0..40] }
    body  { FFaker::BaconIpsum.paragraphs }
  end
end
