"""Functions which helps the locomotive engineer to keep track of the train."""


def get_list_of_wagons(*waggons):
    """Return a list of wagons.

    :param: arbitrary number of wagons.
    :return: list - list of wagons.
    """

    return list(waggons)

def fix_list_of_wagons(each_wagons_id, missing_wagons):
    """Fix the list of wagons.

    :parm each_wagons_id: list - the list of wagons.
    :parm missing_wagons: list - the list of missing wagons.
    :return: list - list of wagons.
    """

    w1, w2, loco, *rest = each_wagons_id
    return [loco, *missing_wagons, *rest, w1, w2]


def add_missing_stops(route, *args, **kwargs):
    """Add missing stops to route dict.

    :param route: dict - the dict of routing information.
    :param: arbitrary number of stops.
    :return: dict - updated route dictionary.
    """

    route["stops"] = list(args) + list(kwargs.values())
    return route

def extend_route_information(route, more_route_information):
    """Extend route information with more_route_information.

    :param route: dict - the route information.
    :param more_route_information: dict -  extra route information.
    :return: dict - extended route information.
    """

    return {**route, **more_route_information}


def fix_wagon_depot(wagons_rows):
    """Fix the list of rows of wagons.

    :param wagons_rows: list[list[tuple]] - the list of rows of wagons.
    :return: list[list[tuple]] - list of rows of wagons.
    """

    [w11, w12, w13], [w21, w22, w23], [w31, w32, w33] = wagons_rows
    return [[w11, w21, w31], [w12, w22, w32], [w13, w23, w33]]
