class Payment < ApplicationRecord
  CURRENCIES = [
    USD = "usd",
    CAD = "cad",
    EUR = "eur",
  ].freeze
end
