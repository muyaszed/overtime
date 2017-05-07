require 'rails_helper'

describe 'navigate post' do
  before do
      @user = FactoryGirl.create(:user) 
      login_as(@user, :scope => :user)  
      
  end
  context 'view all post' do
  	before do
       
        
  		visit posts_path
  	end

  	it "can be reached succesfully" do
  		  
  		expect(page.status_code).to eq(200)  
  	end 

  	it "has a title post" do 
  		  
  		expect(page).to have_content(/Post/)    
  	end 

    it "has a list of posts" do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)    
    end   

    it 'has a scope so that only post from creators can see thier post' do
      post1 = Post.create(date: Date.today, rationale: "asdf", user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: "asdf", user_id: @user.id)

      other_user = User.create(first_name: 'Non', last_name: 'Authorized', email: "nonauth@example.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      post_from_other_user = Post.create(date: Date.today, rationale: "This post shouldn't be seen", user_id: other_user.id)

      visit posts_path

      expect(page).to_not have_content(/This post shouldn't be seen/)
      post_user1 = Post.create(date: Date.today, rationale: "rationale 1", user_id: @user.id)
      user2 = FactoryGirl.create(:other_user)
      post_user2 = Post.create(date: Date.today, rationale: "rationale 2", user_id: user2.id)
      
       visit posts_path 
      expect(page).not_to have_content(/rationale 2/)
    end
  end
 
  context "create new post" do
  	before do
      
      visit root_path
      click_link("new_post")
  	end 
  	it "can be reached" do
  		
  		expect(page.status_code).to eq(200)      
  	end    

  	it "can be created with new form" do
  		
  		fill_in 'post[date]', with: Date.today
  		fill_in 'post[rationale]', with: "rationale"  
  		click_on "Save"
 
  		expect(page).to have_content("rationale")    
  	end 

    it "will have a user associated" do  
      
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User association")     
       
    end       
  end

  context "edit post" do
    before do

      @post = Post.create(date: Date.today, rationale: "1234", user_id: @user.id)
       # @post = FactoryGirl.create(:post)
      # visit posts_path
    end

    

    it "can be edited" do 
      # byebug
      visit edit_post_path(@post)
      # expect(page).to have_content("Updated rationale")
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Updated rationale"
      click_on 'Save'
      expect(page).to have_content("Updated rationale")

    end

    it "cannot be edited by non authorized person" do 
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user) 
      login_as(non_authorized_user, :scope => :user)
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path) 
    end
  end

  context "delete post" do
    it "can be deleted by clicking delete link" do
      @post = FactoryGirl.create(:post)
      # TODO refactor
      @post.update(user_id: @user.id)
      visit posts_path
      click_link("delete_#{@post.id}")
      expect(page.status_code).to eq(200)    
    end 
  end
end 
