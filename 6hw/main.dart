import 'person.dart';
import 'student.dart';
import 'teacher.dart';
import 'subjects.dart';

void main() {
  // 👨‍🏫 Teacher
  Teacher teacher = Teacher("John Brown", 40, true, 10);
  teacher.introduce();
  double salary = teacher.calculateSalary();
  print("Salary: $salary\n");

  // 🎓 Student 1
  Student student1 = Student(
    "Adam White",
    17,
    false,
    {
      Subject.math: 90,
      Subject.physics: 85,
      Subject.english: 92,
    },
  );

  student1.introduce();
  student1.showMarks();
  print("Average mark: ${student1.calculateAverage()}\n");

  // 🎓 Student 2
  Student student2 = Student(
    "Emma Green",
    18,
    false,
    {
      Subject.math: 88,
      Subject.history: 91,
      Subject.english: 95,
    },
  );

  student2.introduce();
  student2.showMarks();
  print("Average mark: ${student2.calculateAverage()}");
}