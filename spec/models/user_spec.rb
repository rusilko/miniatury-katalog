# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = {name: "Tomek Rusilko", email: "tomek.rusilko@gmail.com"}
  end
  
  it "should create a new user" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    u = User.new(@attr.merge(name: ""))
    u.should_not be_valid
  end
  
  it "should require an email" do
    u = User.new(@attr.merge(email: ""))
    u.should_not be_valid
  end
  
  it "should not be longer than 50 characters"  do
    u = User.new(@attr.merge(name: "a"*51))
    u.should_not be_valid
  end
  
  it "should be longer than 1 character"  do
    u = User.new(@attr.merge(name: "a"))
    u.should_not be_valid
  end
  
  it "should accept valid email" do
    valid_emails = %w[tomek@t.pl DUPA.BLADA@DuPa.co.uk tomek_rusilko+amazon@gmail.com]
    valid_emails.each do |e|
      u = User.new(@attr.merge(email: e))
      u.should be_valid
    end
  end
  
  it "should reject invalid email" do
    invalid_emails = %w[user@foo,com user_at_foo.org example.user@foo.]
    invalid_emails.each do |e|
      u = User.new(@attr.merge(email: e))
      u.should_not be_valid
    end
  end
  
  it "should reject user with duplicate email" do
    User.create!(@attr)
    user_with_duplicated_email = User.new(@attr)
    user_with_duplicated_email.should_not be_valid 
  end
  
  it "should reject email identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr)
    user_with_duplicated_email = User.new(@attr.merge(email: upcased_email))
    user_with_duplicated_email.should_not be_valid
  end
end
