import 'dart:math';

class RpgGame {
  static int roundNumber = 0;
  static Random random = Random();

  static void start() {
    Boss boss = Boss(500, 50, 'Boss');

    List<Hero> heroes = [
      Warrior(250, 20, 'Warrior'),
      Magic(200, 15, 'Magic'),
      Medic(220, 5, 'Medic'),
      Golem(400, 10, 'Golem'),
      Lucky(180, 15, 'Lucky'),
      Witcher(250, 0, 'Witcher'),
      Thor(230, 18, 'Thor'),
      Ludoman(200, 10, 'Ludoman'),
    ];

    while (boss.isAlive() && heroes.any((h) => h.isAlive())) {
      roundNumber++;
      print('\nROUND $roundNumber');

      if (boss.isStunned) {
        print('Boss is stunned and skips this round');
        boss.isStunned = false;
      } else {
        boss.attack(heroes);
      }

      for (var hero in heroes) {
        if (hero.isAlive()) {
          hero.attack(boss);
          hero.applySuperPower(boss, heroes);
        }
      }

      print('Boss HP: ${boss.health}');
    }
  }
}

abstract class GameEntity {
  int health;
  int damage;
  String name;

  GameEntity(this.health, this.damage, this.name);

  bool isAlive() => health > 0;
}

abstract class Hero extends GameEntity {
  Hero(int health, int damage, String name) : super(health, damage, name);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Boss extends GameEntity {
  bool isStunned = false;

  Boss(int health, int damage, String name)
      : super(health, damage, name);

  void attack(List<Hero> heroes) {
    Golem? golem;
    for (var h in heroes) {
      if (h is Golem && h.isAlive()) {
        golem = h;
      }
    }

    for (var hero in heroes) {
      if (!hero.isAlive()) continue;

      if (hero is Lucky && RpgGame.random.nextInt(100) < 25) {
        print('Lucky ${hero.name} dodged the attack!');
        continue;
      }

      int dmg = damage;

      if (golem != null && hero != golem && golem.isAlive()) {
        int part = damage ~/ 5;
        golem.health -= part;
        dmg -= part;
      }

      hero.health -= dmg;
    }
  }
}

class Warrior extends Hero {
  Warrior(int h, int d, String n) : super(h, d, n);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Magic extends Hero {
  Magic(int h, int d, String n) : super(h, d, n);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4) {
      for (var hero in heroes) {
        if (hero.isAlive()) hero.damage += 3;
      }
      print('Magic boosted team damage');
    }
  }
}

class Medic extends Hero {
  Medic(int h, int d, String n) : super(h, d, n);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive() && hero.health < 100 && hero != this) {
        hero.health += 10;
        print('Medic healed ${hero.name}');
        break;
      }
    }
  }
}

class Golem extends Hero {
  Golem(int h, int d, String n) : super(h, d, n);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Lucky extends Hero {
  Lucky(int h, int d, String n) : super(h, d, n);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Witcher extends Hero {
  bool used = false;

  Witcher(int h, int d, String n) : super(h, d, n);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (used || !isAlive()) return;

    for (var hero in heroes) {
      if (!hero.isAlive()) {
        hero.health = health;
        health = 0;
        used = true;
        print('Witcher sacrificed himself to resurrect ${hero.name}');
        break;
      }
    }
  }
}

class Thor extends Hero {
  Thor(int h, int d, String n) : super(h, d, n);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor stunned the boss!');
    }
  }
}
class Ludoman extends Hero {
  Ludoman(int health, int damage, String name)
      : super(health, damage, name);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive()) return;

    int dice1 = RpgGame.random.nextInt(6) + 1;
    int dice2 = RpgGame.random.nextInt(6) + 1;

    if (dice1 == dice2) {
      boss.health -= dice1 * dice2;
    } else {
      List<Hero> aliveHeroes =
          heroes.where((h) => h.isAlive() && h != this).toList();

      if (aliveHeroes.isNotEmpty) {
        Hero randomHero =
            aliveHeroes[RpgGame.random.nextInt(aliveHeroes.length)];
        randomHero.health -= dice1 + dice2;
      }
    }
  }
}