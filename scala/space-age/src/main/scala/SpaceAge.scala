object SpaceAge {
  val earthYear = 31557600

  def onEarth(age: Double): Double = age / earthYear

  def onMercury(age: Double): Double = age / (0.2408467 * earthYear)

  def onVenus(age: Double): Double = age / (0.61519726 * earthYear)

  def onMars(age: Double): Double = age / (1.8808158 * earthYear)

  def onJupiter(age: Double): Double = age / (11.862615 * earthYear)

  def onSaturn(age: Double): Double = age / (29.447498 * earthYear)

  def onUranus(age: Double): Double = age / (84.016846 * earthYear)

  def onNeptune(age: Double): Double = age / (164.79132 * earthYear)
}
