require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exists" do
    it "should belong to an user" do
      time = Time.now.freeze
      user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(6))
      @category = FactoryBot.create(:category)
      @transaction_type = FactoryBot.create(:transaction_type)
      expense = Expense.new(amount: 30000, concept: "Uber", date: time, user: user, category: @category, transaction_type: @transaction_type)

      expect(expense.valid?).to eq(true)
      expect(expense.save!).to eq(true)
      expect(Expense.count).to eq(1)
      expect(user.expenses).to eq([expense])
      expect(expense.user).to eq(user)
    end

    context "amount related" do
      before do
        time = Time.now.freeze
        user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @category = FactoryBot.create(:category)
        @transaction_type = FactoryBot.create(:transaction_type)
        @expense = Expense.new(amount: 0, concept: "Uber", date: time, user: user, category: @category, transaction_type: @transaction_type)
      end

    context "the amount is negative" do
      it "should not save the expense" do
        @expense.amount = -200
        expect(@expense.valid?).to be_falsey
        expect(@expense.save).to be_falsey
        expect(@expense.errors.messages).not_to be_empty
      end
    end

      context "the amount is positive" do
        it "should save the expense" do
          @expense.amount = 20000
          expect(@expense.valid?).to be_truthy
          expect(@expense.save).to be_truthy
          expect(@expense.errors.messages).to be_empty
        end
       end
    end

    context "concept related" do
      before do
        time = Time.now.freeze
        user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @category = FactoryBot.create(:category)
        @transaction_type = FactoryBot.create(:transaction_type)
        @expense = Expense.new(amount:20000, date: time, user: user, category: @category, transaction_type: @transaction_type)
      end

      context "the concept is empty" do
        it "should not save the expense and show an error" do
          expect(@expense.valid?).to be_falsey
          expect(@expense.save).to be_falsey
          expect(@expense.errors.messages).not_to be_empty
        end
      end

      context "the concept is not empty" do
        it "should save the expense" do
          @expense.concept = "Uber"
          expect(@expense.concept).to eq("Uber")
          expect(@expense.valid?).to be_truthy
          expect(@expense.save).to be_truthy
          expect(@expense.errors.messages).to be_empty
        end
      end
    end

    context "date related" do
      before do
        user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @category = FactoryBot.create(:category)
        @transaction_type = FactoryBot.create(:transaction_type)
        @expense = Expense.new(amount: 20000, concept: "Uber", user: user, category: @category, transaction_type: @transaction_type)
      end

      context "the date is empty" do
        it "should save the expense and set the current date on the date field" do
          expect(@expense.save).to be_truthy
          expect(@expense.date).not_to be_nil
          expect(@expense.errors.messages).to be_empty
        end
      end

      context "the date is not empty" do
        it "should save the expense" do
          time = Time.now.freeze
          @expense.date = time
          expect(@expense.valid?).to be_truthy
          expect(@expense.save).to be_truthy
          expect(@expense.date).to eq(time)
          expect(@expense.errors.messages).to be_empty
        end
      end
    end

    context "category related" do
      before do
        time = Time.now.freeze
        user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @category = FactoryBot.create(:category)
        @transaction_type = FactoryBot.create(:transaction_type)
        @expense = Expense.new(amount: 20000, concept: "Uber", user: user, transaction_type: @transaction_type)
      end

      context "the expense has a category" do
        it "should save the expense" do
          @expense.category = @category
          expect(@expense.valid?).to be_truthy
          expect(@expense.save).to be_truthy
          expect(@expense.errors.messages).to be_empty
        end
      end

      context "category not there" do
        it "should not save the expense" do
          expect(@expense.valid?).to be_falsey
          expect(@expense.save).to be_falsey
          expect(@expense.errors).not_to be_empty
       end
     end
    end

    context "transaction_type related" do
      before do
        time = Time.now.freeze
        user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @category = FactoryBot.create(:category)
        @transaction_type = FactoryBot.create(:transaction_type)
        @expense = Expense.new(amount: 20000, concept: "Uber", user: user, category: @category)    
      end

      context "the expense has a transaction_type" do
        it "should save the expense" do
          @expense.transaction_type = @transaction_type
          expect(@expense.valid?).to be_truthy
          expect(@expense.save).to be_truthy
          expect(@expense.errors.messages).to be_empty
        end
      end

      context "transaction_type not there" do
        it "should not save the expense" do
          expect(@expense.valid?).to be_falsey
          expect(@expense.save).to be_falsey
          expect(@expense.errors).not_to be_empty
       end
     end
      
    end

  end
end
