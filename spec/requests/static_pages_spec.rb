require 'spec_helper'

describe "StaticPages" do
   
   subject { page }
   
   shared_examples_for "all static pages" do
      it { should have_selector('h1',    text: heading) }
      it { should have_selector('title', text: full_title(page_title)) }
   end
   
   # Home Page tests
   describe "Home page" do
      before { visit root_path }
      let(:heading)    { 'Sample App' }
      let(:page_title) { '' } 
      
      it_should_behave_like "all static pages"
      it { should_not have_selector 'title', text: '| Home' }
      
   end
   
   # Help page tests
   describe "Help page" do
      
      before { visit help_path }
      let(:heading)    { 'Help' }
      let(:page_title) { 'Help' } 
      
      it_should_behave_like "all static pages"
      
   end
   
   # About page tests
   describe "About page" do
         
      before { visit about_path }
      let(:heading)    { 'About' }
      let(:page_title) { 'About Us' } 
      
      it_should_behave_like "all static pages"
         
   end
   
   # Contact page tests
   describe "Contact page" do
         
      before { visit contact_path }
      let(:heading)    { 'Contact' }
      let(:page_title) { 'Contact' } 
      
      it_should_behave_like "all static pages"
         
   end
   
   
   # Test the links
   it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About Us')
      click_link "Help"
      page.should have_selector 'title', text: full_title('Help')
      click_link "Contact"
      page.should have_selector 'title', text: full_title('Contact')
      click_link "Home"
      click_link "Sign up now!"
      page.should have_selector 'title', text: full_title('Sign Up')
      click_link "sample app"
      page.should have_selector 'title', text: "Rails Tutorial Sample App"
   end
end

