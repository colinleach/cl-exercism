# Given a numeric score between 0 and 100, output a letter grade
# - "A" is 90% - 100%
# - "B" is 80% - 89%
# - "C" is 70% - 79%
# - "D" is 60% - 69%
# - "F" is  0% - 59%

def letter_grade:
  if . >= 90 then "A"
  elif . >= 80 then "B"
  elif . >= 70 then "C"
  elif . >= 60 then "D"
  else "F"
  end;


# Given an object that maps a student's name to their grade,
# generate an object that maps the letter grade to the number of 
# students with that grade

def count_letter_grades:
  to_entries |
  {"A": 0, "B": 0, "C": 0, "D": 0, "E": 0, "F": 0} as $counts | 
  reduce .[] as $student ($counts; .[$student.value | letter_grade] += 1) 
  ;
