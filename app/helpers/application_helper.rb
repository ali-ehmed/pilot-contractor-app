module ApplicationHelper
  def display_amount(amount, currency)
    number_to_currency(amount, unit: Payment::CURRENCY_UNITS[currency])
  end
end
