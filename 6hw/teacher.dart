import 'person.dart';

class Teacher extends Person {
  int experience;
  static double _baseSalary = 50000;

  Teacher(String fullName, int age, bool isMarried, this.experience)
      : super(fullName, age, isMarried);

  double calculateSalary() {
    double salary = _baseSalary;

    if (experience > 3) {
      for (int i = 4; i <= experience; i++) {
        salary += salary * 0.05;
      }
    }

    if (isMarried) {
      salary += 5000;
    }

    return salary;
  }

  @override
  void introduce() {
    super.introduce();
    print("Experience: $experience years.");
  }
}