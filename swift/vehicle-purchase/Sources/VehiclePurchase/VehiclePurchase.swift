import Foundation

func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  let monthlyPayments = price / 60
  if monthlyPayments <= monthlyBudget {
    return "Yes! I'm getting a \(vehicle)"
  } else if monthlyPayments <= monthlyBudget * 1.1  {
    return "I'll have to be frugal if I want a \(vehicle)"
  } else {
    return "Darn! No \(vehicle) for me"
  }
}

func licenseType(numberOfWheels wheels: Int) -> String {
  switch wheels {
    case 2:
      return "You will need a motorcycle license for your vehicle"
    case 4, 6:
      return "You will need an automobile license for your vehicle"
    case 18:
      return "You will need a commercial trucking license for your vehicle"
    default:
      return "We do not issue licenses for those types of vehicles"
  }
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
  guard yearsOld < 10 else { return 25 }
  let basePrice = msrp > 25_000 ? msrp : 25_000
  let fee = Double(basePrice) * (1.0 - 0.1 * Double(yearsOld)) / 100
  return Int(floor(fee))
}
