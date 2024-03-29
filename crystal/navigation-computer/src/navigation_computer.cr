class Navigation
  NEPTUNE_DISTANCE = 4_400_000_000_i64
  MARS_DISTANCE = 227_940_000_int32
  ATMOSPHERE_DISTANCE = 10_000_i16

  def correct_area_analysis(measurement)
    measurement.to_u32
  end

  def calculate_velocity(distance, time)
    (distance.to_f / time).to_f32
  end
end
