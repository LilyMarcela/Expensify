# shows graphic information and statistics regarding the expenses that will appear in the dashboard.

class DashboardHandler
  def intialize(expenses)
    @expenses = expenses
  end


  def today_expenses
    @expenses.daily_expenses.pluck(:amount).sum
  end

  def yesterday_expenses
  end

  def this_month_expenses
  end

  def last_month_expenses
  end

  def last_6_month_expenses
  end

  def by_day_expenses
  end

  def by_category
  end

  def accumulated_expenses
  end

end