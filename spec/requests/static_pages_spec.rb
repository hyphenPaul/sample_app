require 'spec_helper'

describe "Static pages" do
	  
	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

	describe "Home page" do

		it "should have the content 'Sample App'" do
			visit '/static_pages/home'
			page.should have_content('Sample App')
		end

		it "should should have the title 'Home'" do
			visit '/static_pages/home'
			page.should have_selector('title',
				:text => "#{base_title} | Home")
		end

	end

	describe "Help page" do

		it "should have the content 'Help'" do
			visit '/static_pages/help'
			page.should have_content('Help')
		end

		it "should should have the title 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('title',
				:text => "#{base_title} | Help")
		end

	end

	describe "About page" do
		it "should should have the content 'About Us'" do
			visit '/static_pages/about'
			page.should have_content('About')
		end

		it "should should have the title 'About'" do
			visit '/static_pages/about'
			page.should have_selector('title',
				:text => "#{base_title} | About")
		end
	
	end


	describe "Contact Page" do
		it "should have the content 'Contact'" do
			visit '/static_pages/contact'
			page.should have_content('Contact')
		end

		it "should have the title 'Contact'" do
			visit '/static_pages/contact'
			page.should have_selector('title',
				:text => "#{base_title} | Contact")
		end

		it "should have the header 'Contact'" do
			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Contact')
		end

	end

end
