import gleam/dict
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub type Grades =
  dict.Dict(Int, List(String))

pub type School {
  School(grades: Grades)
}

pub fn create() -> School {
  School(grades: dict.new())
}

pub fn roster(school: School) -> List(String) {
  school.grades
  |> dict.to_list()
  |> list.sort(fn(x, y) { int.compare(x.0, y.0) })
  |> list.flat_map(fn(x) { x.1 })
}

pub fn add(
  to school: School,
  student student: String,
  grade grade_n: Int,
) -> Result(School, Nil) {
  case has(school, student) {
    True -> Error(Nil)
    False -> {
      let xs = grade(school, grade_n)
      let students = xs |> list.append([student]) |> list.sort(string.compare)
      let grades = school.grades |> dict.insert(grade_n, students)
      Ok(School(grades: grades))
    }
  }
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  school.grades |> dict.get(desired_grade) |> result.unwrap([])
}

fn has(school: School, student: String) -> Bool {
  school.grades |> dict.values() |> list.flatten |> list.contains(student)
}
