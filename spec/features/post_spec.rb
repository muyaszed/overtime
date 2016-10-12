require 'rails_helper'

describe 'navigate' do
  context 'index' do
  	before do
  		visit posts_path
  	end

  	it "can be reached succesfully" do
  		  
  		expect(page.status_code).to eq(200)  
  	end 

  	it "has a title post" do
  		  
  		expect(page).to have_content(/Post/)   
  	end  
  end
 
  context "create new post" do
  	before do
      user = User.create(email: "test@test.com", password: "12345678", password_confirmation: "12345678", first_name: "Yazed", last_name: "jamal")
  		login_as(user, :scope => :user)
      visit new_post_path
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
      # expect(Post.last.user.email).to eq("test@test.com")  
    end    
  end
end 
