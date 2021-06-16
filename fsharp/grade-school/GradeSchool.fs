module GradeSchool

type School = Map<int, string list>

let empty: School = 
    Map.empty

let add (student: string) (grade: int) (school: School): School = 
    match (Map.containsKey grade school) with
    | true -> 
        let students = List.sort (student :: Map.find grade school)
        school.Add (grade, students)
    | false -> 
        school.Add (grade, [student])

let roster (school: School): string list = 
    Map.fold 
        (fun acc key value -> (acc @ value))
        []
        school

let grade (number: int) (school: School): string list = 
    match (Map.containsKey number school) with
    | true  -> Map.find number school
    | false -> []
