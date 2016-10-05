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
  end
end 
