class Reactor
  def self.is_criticality_balanced?(temperature, neutrons_emitted)
    temperature < 800 && neutrons_emitted > 500 && temperature * neutrons_emitted < 500_000
  end

  def self.reactor_efficiency(voltage, current, theoretical_max_power)
    efficiency = voltage * current * 100 / theoretical_max_power
    if efficiency >= 80
      state = "green"
    elsif efficiency >= 60
      state = "orange"
    elsif efficiency >= 30
      state = "red"
    else
      state = "black"
    end
    state
  end

  def self.fail_safe(temperature, neutrons_produced_per_second, threshold)
    state = temperature * neutrons_produced_per_second / threshold
    if state < 0.9
      condition = "LOW"
    elsif state < 1.1
      condition = "NORMAL"
    else
      condition = "DANGER"
    end
    condition
  end
end
