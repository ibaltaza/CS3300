require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  context "Create new post" do
    before(:each) do
      visit new_post_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "About", with: "Test about"
      click_button "Create Post"
      expect(page).to have_content("Post was successfully created")
    end

    scenario "should fail" do
      click_button "Create Post"
      expect(page).to have_content("About can't be blank")
    end
  end

  context "Update post" do
    let(:post) { Post.create(title: "Test title", about: "Test content") }
    before(:each) do
      visit edit_post_path(post)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "About", with: "New about content"
      end
      click_button "Update Post"
      expect(page).to have_content("Post was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "About", with: ""
      end
      click_button "Update Post"
      expect(page).to have_content("About can't be blank")
    end
  end

  context "Remove existing post" do
    let!(:post) { Post.create(title: "Test title", about: "Test content") }
    scenario "remove post" do
      visit posts_path
      click_link "Destroy"
      expect(page).to have_content("Post was successfully destroyed")
      expect(Post.count).to eq(0)
    end
  end
end