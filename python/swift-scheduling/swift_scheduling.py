from datetime import datetime, timedelta


def delivery_date(start, description):
    start_dt = datetime.fromisoformat(start)

    match description:
        case "NOW":
            delivery_dt = start_dt + timedelta(hours=2)
        case "ASAP":
            delivery_dt = datetime(start_dt.year, start_dt.month, start_dt.day, 17, 0, 0) if start_dt.hour < 13 \
                else datetime(start_dt.year, start_dt.month, start_dt.day + 1, 13, 0, 0)
        case "EOW":
            day_of_week = start_dt.isoweekday()
            if day_of_week <= 3:
                start_dt += timedelta(days = 5 - day_of_week)
                target_hour = 17
            else:
                start_dt += timedelta(days = 7 - day_of_week)
                target_hour = 20
            delivery_dt = datetime(start_dt.year, start_dt.month, start_dt.day, target_hour, 0, 0)
        case _ if description.endswith("M"):
                m = int(description[:-1])
                y = start_dt.year + 1 if start_dt.month >= m else start_dt.year
                target = datetime(y, m, 1, 8)
                weekday = target.isoweekday()
                delivery_dt = target if weekday < 5 else target + timedelta(days = 8 - weekday)
        case _ if description.startswith("Q"):
                q = int(description[1])
                current = (start_dt.month + 2) // 3
                m = (3 * q + 1) % 12
                rollover = 1 if current > q or q == 4 else 0
                due_date = datetime(start_dt.year + rollover, m, 1, 8) - timedelta(days=1)
                weekday = due_date.isoweekday()
                delivery_dt = due_date if weekday <= 5 else due_date - timedelta(days = weekday - 5)
        case _:
            return "Error"

    return delivery_dt.isoformat()
