require 'rails_helper'

describe 'navigate' do
  context 'index' do
  	it "can be reached succesfully" do
  		visit posts_path
  		expect(page.status_code).to eq(200)  
  	end 

  	it "has a title post" do
  		visit posts_path
  		expect(page).to have_content(/Post/)   
  	end 
  end
end 
