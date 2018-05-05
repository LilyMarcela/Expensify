require 'rails_helper'

RSpec.describe DashboardHandler do

  before do
    time =Time.now.freeze
    @user = FactoryBot.create(:user)
    new_expense_1 = FactoryBot.create(:expense, user: @user, date: time)
    new_expense_2 = FactoryBot.create(:expense, user: @user, concept: "This is something", date: time)
    new_expense_3 = FactoryBot.create(:expense, user: @user, amount: 40000, date: time)

  end
    describe ".today_expenses" do
      context "The expense exist" do
          it "should calculate today expenses" do
            new_handler = described_class.new(@user.expenses)

            expect(new_handler.today_expenses).to eq(true)
            expect(new_handler.today_expenses).not_to be_empty 
            expect(new_handler.today_expenses).to eq(40000)
          end
      end
  
     end




end