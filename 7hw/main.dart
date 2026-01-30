import 'device.dart';
import 'smart_lamp.dart';
import 'smart_speaker.dart';
import 'smart_thermostat.dart';

void main() {
  List<Device> devices = [
    SmartLamp("Living Room Lamp"),
    SmartSpeaker("Kitchen Speaker"),
    SmartThermostat("Bedroom Thermostat", 22),
  ];

  for (var device in devices) {
    device.showInfo();
    device.turnOn();

    // Проверка и кастинг
    if (device is Adjustable) {
      (device as Adjustable).increase();
    }

    if (device is BatteryPowered) {
      (device as BatteryPowered).showBattery();
    }

    print(""); // пустая строка для читаемости
  }

  print("All devices processed.");
}