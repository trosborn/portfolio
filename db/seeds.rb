5.times do |i|
  Post.create(title: "Post #{i}", body: "Post #{i}")
end
