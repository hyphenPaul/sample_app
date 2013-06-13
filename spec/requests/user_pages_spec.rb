require 'spec_helper'


RSpec::Matchers.define :have_success_message do |message|
	match do |actual|
		actual.should have_selector('div.alert.alert-success', text: message)
	end
end

describe "User Pages" do
  
	subject { page }

	describe "signup page" do
		
		before { visit signup_path }

		it { should have_selector( 'h1', text: 'Sign Up' )}
		it { should have_selector( 'title', text: full_title('Sign Up')) }

	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_selector( 'h1', text: user.name ) }
		it { should have_selector( 'title', text: user.name ) }

	end

	describe "signup" do
		
		before { visit signup_path }

		let(:submit) { "Create my account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_selector( 'title', text: full_title('Sign Up')) }
				it { should have_content( "errors" ) }
				it { should have_content( "Email is invalid") }
				it { should have_content( "Password is too short" )}
				it { should have_css("div.alert.alert-error")}
				it { should_not have_content("Password digest can't be blank") }
			end

		end

		describe "with valid information" do
			before { valid_signup }

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }

				let(:user) { retrieve_test_user }

				it { should have_selector( 'title', text: user.name) }
				it { should have_success_message("Welcome") }
				it { should have_link("Sign out") }

				describe "followed by signout" do
					before { click_link "Sign out" }
					it { should have_link('Sign in') }
				end
			end

		end

	end

end
