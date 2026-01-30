// smart_speaker.dart
import 'device.dart';

class SmartSpeaker extends Device with BatteryPowered implements Adjustable {
  int volume = 50;

  SmartSpeaker(String name) : super(name);

  @override
  void turnOn() {
    print("Speaker $name is ON");
  }

  @override
  void turnOff() {
    print("Speaker $name is OFF");
  }

  @override
  void increase() {
    volume += 5;
    if (volume > 100) volume = 100;
    print("Volume: $volume");
  }

  @override
  void decrease() {
    volume -= 5;
    if (volume < 0) volume = 0;
    print("Volume: $volume");
  }

  @override
  void showInfo() {
    print("Speaker: $name, Volume: $volume");
  }
}