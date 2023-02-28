defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100
  end

  def effective_daily_rate(hourly_rate, discount) do
    apply_discount(daily_rate(hourly_rate), discount)
  end

  def monthly_rate(hourly_rate, discount) do
    effective_daily_rate(hourly_rate, discount) * 22
    |> Float.ceil()
    |> trunc()
   end

  def days_in_budget(budget, hourly_rate, discount) do
    budget / effective_daily_rate(hourly_rate, discount)
    |> Float.floor(1)
   end
end
