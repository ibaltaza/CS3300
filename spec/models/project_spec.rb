require "rails_helper"

RSpec.describe Post, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      post = Post.new(about: "Content of about")
      expect(post.valid?).to eq(false)
    end

    it "ensures about is present" do
      post = Post.new(title: "Title")
      expect(post.valid?).to eq(false)
    end
    
    it "should be able to save post" do
      post = Post.new(title: "Title", about: "Some about content goes here")
      expect(post.save).to eq(true)
    end
  end

  context "scopes tests" do
    let(:params) { { title: "Title", about: "some about" } }
    before(:each) do
      Post.create(params)
      Post.create(params)
      Post.create(params)
    end

    it "should return all posts" do
      expect(Post.count).to eq(3)
    end

  end
end