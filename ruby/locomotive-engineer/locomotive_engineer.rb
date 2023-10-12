class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    w1, w2, loco, *others = each_wagons_id
    first = [w1, w2]
    return loco, *missing_wagons, *others, *first
  end

  def self.add_missing_stops(routing, **stops)
    routing[:stops] = stops.values
    routing
  end

  def self.extend_route_information(route, more_route_information)
    return **route, **more_route_information
  end
end
