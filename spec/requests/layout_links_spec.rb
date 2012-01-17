require 'spec_helper'

describe "LayoutLinks" do

  before(:each) do
    @base_title = "Katalog Miniatur | "
  end

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', content: @base_title + "Home")
  end
  
  it "shoud have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', content: @base_title + "Contact")
  end
  
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', content: @base_title + "About")
  end
  
  it "shoud have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', content: @base_title + "Help")
  end
  
  it "shoud have a Sign-up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', content: @base_title + "User Sign-up")
  end
  
  it "should have the right links which lead to expected sites" do
    visit root_path
    click_link "About"
    response.should have_selector('title', content: @base_title + "About")
    
    click_link "Home"
    response.should have_selector('title', content: @base_title + "Home")
    
    click_link "Help"
    response.should have_selector('title', content: @base_title + "Help")
    
    click_link "Contact"
    response.should have_selector('title', content: @base_title + "Contact")
    
    click_link "sign up!"
    response.should have_selector('title', content: @base_title + "User Sign-up")
  end
end
