// device.dart

// Интерфейсы
abstract class Switchable {
  void turnOn();
  void turnOff();
}

abstract class Adjustable {
  void increase();
  void decrease();
}

// Абстрактный класс Device
abstract class Device implements Switchable {
  final String name;
  Device(this.name);

  void showInfo() {
    print('Device: $name');
  }
}

// Миксин BatteryPowered
mixin BatteryPowered {
  int batteryLevel = 100;

  void showBattery() {
    print('Battery level: $batteryLevel%');
  }
}