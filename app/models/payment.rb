class Payment < ApplicationRecord
  CURRENCIES = [
    USD = "usd",
    CAD = "cad",
    EUR = "eur",
  ].freeze
  CURRENCY_UNITS = {
    USD => '$',
    CAD => '$',
    EUR => '€',
  }.freeze
end
