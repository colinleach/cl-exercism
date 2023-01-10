import std/sequtils
import std/algorithm
# import sugar

type
  Student* = tuple[name: string, grade: int]
  School* = object
    students*: seq[Student]

proc get_names(studs: seq[Student]): seq[string] =
    var names: seq[string]
    for s in studs: 
        names.add(s.name)
    names

proc roster*(sch: School): seq[string] = 
    let sorted_school = sch.students.sortedByIt((it.grade, it.name))
    return get_names(sorted_school)

proc grade*(sch: School, g: int): seq[string] =
    let students_in_grade: seq[Student] = sch.students.filterIt(it.grade == g).sorted()
    get_names(students_in_grade)

proc add_student*(sch: var School, n: string, g: int) =
    let names = get_names(sch.students)
    if names.filterIt(it == n) != @[]:
        var e: ref ValueError
        new(e)
        raise e
    var student: Student
    student.name = n
    student.grade = g
    sch.students.add(student)

