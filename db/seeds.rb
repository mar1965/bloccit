include RandomData
 
# Create Posts
50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

# Add a unique non-random Post
p = Post.find_or_create_by(title: 'Non Random Post', body: 'This is a non-random post')
posts = Post.all
 
# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
# Add a unique comment to the non-random Post created
Comment.find_or_create_by(post: p, body: 'This is a non-random comment')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
