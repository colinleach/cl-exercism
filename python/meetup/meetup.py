from calendar import Calendar

# subclassing the built-in ValueError to create MeetupDayException
class MeetupDayException(ValueError):
    """Exception raised when the Meetup weekday and count do not result in a valid date.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message


def meetup(year, month, week, day_of_week):
    cal = Calendar()
    weekdays = {"Monday": 0,
                "Tuesday": 1,
                "Wednesday": 2,
                "Thursday": 3,
                "Friday": 4,
                "Saturday": 5,
                "Sunday": 6, }

    week_specifiers = {"first": 0,
                       "second": 1,
                       "third": 2,
                       "fourth": 3,
                       "fifth": 4,
                       "last": -1,}

    valid_dates = [d for d in cal.itermonthdates(year, month) if
                   d.month == month and
                   d.weekday() == weekdays[day_of_week]]

    if week in week_specifiers:
        if len(valid_dates) > week_specifiers[week]:
            return valid_dates[week_specifiers[week]]
        else:
            raise MeetupDayException("That day does not exist.")

    if week == "teenth":
        teenth = [d for d in valid_dates if 13 <= d.day <= 19]
        assert len(teenth) == 1
        return teenth[0]

    raise MeetupDayException("That day does not exist.")

