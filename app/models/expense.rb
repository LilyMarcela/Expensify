class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :transaction_type

  validates :user_id, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :concept, presence: true
  validate :date_cant_be_nil
  validates :transaction_type, presence: true


  scope :last_six_months, -> { where("date >= ?", 6.months.ago) }
  scope :this_month,  -> { where("date > ?", Date.today.at_beginning_of_month)}
  scope :by_category, -> {this_month.group_by {|expense| expense.category.name}}
  scope :comparative, -> {this_month.group_by {Date.today -1.month}}

  def date_cant_be_nil
    if self.date.nil?
      self.date = Time.now
    end
  end

end
