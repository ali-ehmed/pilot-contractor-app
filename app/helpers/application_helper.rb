module ApplicationHelper
  def display_amount(amount, currency)
    number_to_currency(amount, unit: Payment::CURRENCY_UNITS[currency])
  end

  def display_status(status)
    css_class = ''
    css_class.concat('text-gray-500') if status == Payment::DRAFT
    css_class.concat('text-amber-500') if status == Payment::PENDING
    css_class.concat('text-green-500') if status == Payment::APPROVED
    css_class.concat('text-red-500') if status == Payment::REJECTED

    content_tag(:span, status.upcase, class: css_class)
  end
end
