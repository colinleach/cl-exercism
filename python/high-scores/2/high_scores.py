class HighScores:
    def __init__(self, scores):
        self.score_list = scores

    def scores(self):
        return self.score_list

    def latest(self):
        return self.score_list[-1]

    def personal_best(self):
        return max(self.score_list)

    def personal_top_three(self):
        sorted_scores = sorted(self.score_list, reverse=True)
        return sorted_scores[:3] if len(sorted_scores) >= 3 else sorted_scores
