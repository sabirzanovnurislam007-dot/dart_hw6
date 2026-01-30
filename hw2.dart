import 'dart:io';

void main() {
  print('Age:');
  int age = int.parse(stdin.readLineSync()!);

  print('Temp:');
  int temp = int.parse(stdin.readLineSync()!);

  if (age >= 20 && age <= 45 && temp >= -20 && temp <= 30) {
    print('You can go for a walk');
  } else if (age < 20 && temp >= 0 && temp <= 28) {
    print('You can go for a walk');
  } else if (age > 45 && temp >= -10 && temp <= 25) {
    print('You can go for a walk');
  } else {
    print('Stay home');
  }

  print('Day:');
  String day = stdin.readLineSync()!.toLowerCase();

  if (day == 'monday') {
    print('Its the start of the week');
  } else if (day == 'tuesday') {
    print('Keep going, almost weekend');
  } else if (day == 'wednesday') {
    print('Keep going, almost weekend');
  } else if (day == 'thursday') {
    print('Keep going, almost weekend');
  } else if (day == 'friday') {
    print('Weekend is coming');
  } else if (day == 'saturday') {
    print('Enjoy your weekend');
  } else if (day == 'sunday') {
    print('Enjoy your weekend');
  } else {
    print('Invalid day');
  }

  print('Password:');
  String pass = stdin.readLineSync()!;

  if (pass == '') {
    print('Password empty');
  } else if (pass.length < 6) {
    print('Password too short');
  } else if (pass == 'dart123') {
    print('Access granted');
  } else {
    print('Wrong password');
  }
}
