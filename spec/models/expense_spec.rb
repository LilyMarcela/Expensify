require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exist" do
    it "should belong to a user" do
      time = Time.now.freeze
      user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(6))
      user.inspect
      expense = Expense.create(amount: 30000, concept: "Uber", date: time, user_id: user.id)
      puts expense.inspect
      expect(expense.valid?).to eq(true)
    end
  end

end
