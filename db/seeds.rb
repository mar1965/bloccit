include RandomData

# Create Advertisements
50.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy:  RandomData.random_paragraph,
    price: RandomData.random_numbers
  )
end
advertisements = Advertisement.all

puts "Seed finished"
puts "#{Advertisement.count} advertisements created"
