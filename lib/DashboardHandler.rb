# shows graphic information and statistics regarding the expenses that will appear in the dashboard.

class DashboardHandler
  def intialize(expenses)
    @expenses = expenses
  end


  def today_expenses
    @expenses.daily_expenses.pluck(:amount).sum
  end

  def yesterday_expenses
    @expenses.last_day_expenses.pluck(:amount).sum

  end

  def current_month_expenses
    @expenses.this_month_expenses.pluck (:amount).sum
  end

  def last_month_expenses
    
  end

  def last_six_month_expenses
  end

  def current_month_by_day
  end

  def current_month_by_category
  end

  def accumulated_aganist_last_month
  end

end