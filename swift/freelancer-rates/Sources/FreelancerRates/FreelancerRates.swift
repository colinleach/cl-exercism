// import Swift
import Foundation

func dailyRateFrom(hourlyRate: Int) -> Double {
  Double(8 * hourlyRate)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  round(dailyRateFrom(hourlyRate: hourlyRate) * 22.0 * (1.0 - discount/100))
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let effectiveDailyRate = round(dailyRateFrom(hourlyRate: hourlyRate) * (1.0 - discount/100))
  return floor(budget / effectiveDailyRate)
}
