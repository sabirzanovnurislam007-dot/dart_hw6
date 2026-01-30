void main() {
  //Моя визитка
  String name = "Nurislam";
  int age = 18;
  String city = "Bishkek";
  String profession = "Student";
  String hobby = "programming";

  print("Hello! My name is $name.");
  print("I am $age years old and I live in $city.");
  print("My profession is $profession.");
  print("In my free time, I enjoy $hobby.");

  //Расчёт дохода
  int salary = 5000;
  int yearlyIncome = salary * 12;
  double yearlyIncomeWithBonus = yearlyIncome * 1.1;

  print("My yearly income: $yearlyIncome USD.");
  print("My yearly income with 10% bonus: $yearlyIncomeWithBonus USD.");

  // Работа со строкой
  String text = " Knowledge is power, but practice makes perfect. ";

  String trimmedText = text.trim();
  String upperText = trimmedText.toUpperCase();
  String replacedText = trimmedText.replaceAll("practice", "experience");
  bool containsPower = trimmedText.contains("power");

  print("Trimmed text: '$trimmedText'");
  print("Uppercase text: '$upperText'");
  print("Replaced text: '$replacedText'");
  print("Contains 'power': $containsPower");

  //  Яблоки
  int apples = 10;
  int people = 4;

  print("Each person gets ${apples ~/ people} apples.");
  print("Apples left: ${apples % people}.");

  //Год рождения
  int currentYear = 2026;
  int myAge = 18;

  print("I was born in ${currentYear - myAge}.");

  // var и final
  var cityName = "Bishkek";
  final country = "Kyrgyzstan";

  cityName = "Bishkek ";

  print("City: $cityName");
  print("Country: $country");
}
