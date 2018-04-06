require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exist" do
    it "should belong to a user" do
      time = Time.now.freeze
      expense = Expense.create(amount: 30000, concept: "Uber", date: time)
      puts expense.inspect
      expect(expense.save).to eq(true)
    end
  end

end
