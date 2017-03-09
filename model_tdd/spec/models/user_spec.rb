require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is invalid without an email" do
    expect(User.new(email: nil)).not_to be_valid
  end

  it "duplicate emails are invalid" do
    User.create(email: 'bob@gmail.com')
    user = User.new(email: 'bob@gmail.com')
    expect(user).not_to be_valid
  end

  context ".by_letter" do
    it "returns a sorted array of emails that start with a certain letter" do
      bob = User.create(email: 'bob@gmail.com')
      frank = User.create(email: 'frank@gmail.com')
      bill = User.create(email: 'bill@gmail.com')
      expect(User.by_letter('b')).to eq [bill, bob]
    end
  end

end
