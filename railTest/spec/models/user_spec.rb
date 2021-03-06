require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # This is our control
  context "With valid attributes" do 
    it "should save" do 
      user = User.new(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(user).to be_valid
    end
  end

  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
      user = User.new(
            first_name: '', 
            last_name: 'chang', 
            email: 'schang@codingdojo.com'
        )
      expect(user).to be_invalid
    end
  end
  
  context 'with invalid last name'do
    it "should not save if last_name field is blank" do
      user = User.new(
        first_name:'shane',
        last_name: '',
        email: 'schang@codigndojo.com'
      )
      expect(user).to be_invalid
    end
  end
  
  context 'with invalid email' do 
    it "should not save if email already exists" do
    user = User.new(
      first_name:'shane',
      last_name: 'chang',
      email: ''
    )
    expect(user).to be_invalid
    end
  end
  
  context 'with invalid email format' do
    it "should not save if invalid email format" do
      user = User.new(
        first_name:'shane',
        last_name: 'chang',
        email: 'schangcodingdojocom'
      )
      expect(user).to be_invalid
    end
  end
end
