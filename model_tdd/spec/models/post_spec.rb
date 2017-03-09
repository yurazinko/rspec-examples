require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "doesn't allow a given user to create multiple posts with the same link" do
    user = User.create(email: 'bob@gmail.com')
    user.posts.create(link: 'http://codequizzes.wordpress.com/')
    post = user.posts.new(link: 'http://codequizzes.wordpress.com/')
    expect(post).not_to be_valid
  end

  context "#short_link" do
    it "summarizes the link" do
      post = Post.new(link: 'http://codequizzes.wordpress.com/#something-thats-real')
      expect(post.short_link).to eq "codequizzes.wordpress.com"
    end
  end

  it "doesn't allow links with invalid formats" do
    post = Post.new(link: "blah blah blah")
    expect(post).not_to be_valid
  end
end
