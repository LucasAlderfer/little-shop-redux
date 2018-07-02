module CurrencyConversion
  def to_currency
    amount = BigDecimal.new(:unit_price)
    rounded = (amount * 100).round / 100
    printf('%.02f', rounded)
  end
end
