def round_scores(student_scores):
    """
    :param student_scores: list of student exam scores as float or int.
    :return: list of student scores *rounded* to nearest integer value.
    """

    return [round(x) for x in student_scores]


def count_failed_students(student_scores):
    """
    :param student_scores: list of integer student scores.
    :return: integer count of student scores at or below 40.
    """

    fails  = list(filter(lambda score: score <= 40, student_scores))
    return len(fails)


def above_threshold(student_scores, threshold):
    """
    :param student_scores: list of integer scores
    :param threshold :  integer
    :return: list of integer scores that are at or above the "best" threshold.
    """

    return list(filter(lambda score: score >= threshold, student_scores))


def letter_grades(highest):
    """
    :param highest: integer of highest exam score.
    :return: list of integer score thresholds for each F-A letter grades.
    """

    step = (highest - 40) / 4
    return [int(41 + i * step) for i in range(4)]


def student_ranking(student_scores, student_names):
    """
     :param student_scores: list of scores in descending order.
     :param student_names: list of names in descending order by exam score.
     :return: list of strings in format ["<rank>. <student name>: <score>"].
     """

    results = zip(student_names, student_scores)
    return [f'{i + 1}. {name}: {score}' for i, (name, score) in enumerate(results)]


def perfect_score(student_info):
    """
    :param student_info: list of [<student name>, <score>] lists
    :return: first `[<student name>, 100]` or `[]` if no student score of 100 is found.
    """
    perfects = [student for student in student_info if student[1] == 100]
    return perfects[0] if len(perfects) > 0 else []
