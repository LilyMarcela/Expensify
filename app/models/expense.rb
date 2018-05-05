class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :transaction_type

  validates :user_id, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :concept, presence: true
  validate :date_cant_be_nil
  validates :transaction_type, presence: true
  
scope :last_six_months, -> { where("date >= ?", 6.months.ago)}
  scope :this_month, -> { where("date >= ?", 0.month.ago.beginning_of_month)}
  scope :by_category_this_month, -> { this_month.group_by { |expense| expense.category.name}}
  scope :by_category_last_six_month, -> { last_six_months.group_by { |expense| expense.category.name}}
  scope :by_transaction_this_month, -> { this_month.group_by { |expense| expense.transaction_type.name}}
  scope :by_transaction_last_six_month, -> { last_six_months.group_by { |expense| expense.transaction_type.name}}
  scope :last_month, -> { where("date >= ? and date >= ?", 1.month.ago.beginning_of_month, 1.month.ago.end_of_month)}
  scope :amount_last_month, -> {last_month.pluck(:amount).sum }
  scope :amount_this_month, -> {this_month.pluck(:amount).sum }
  scope :daily_expenses, -> {where('date >=?', 1.day.ago.end_of_day)}
  scope :yesterday_expenses, -> {where('date between ? and ?', 1.day.ago.beginning_of_day, 1.day.ago.end_of_day)}



  def total
    self.sum(:amount)
  end 

  def date_cant_be_nil
    if self.date.nil?
      self.date = Time.now
    end
  end

end
