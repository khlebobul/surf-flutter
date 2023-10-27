//  Я большой фанат волебола, поэтому ...

class Person {
  String name;

  Person(this.name);

  void displayInfo() {
    print('Name: $name');
  }
}

class Player extends Person {
  int height;

  Player(String name, this.height) : super(name);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Height: $height');
  }
}

class Coach extends Person {
  int trophiesWon;

  Coach(String name, this.trophiesWon) : super(name);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Trophies Won: $trophiesWon');
  }
}

class PlayerRole {
  String name;
  String description;

  PlayerRole(this.name, this.description);
}

void main() {
  var player = Player('Maxim Mikhaylov', 202);
  var coach = Coach('Vladimir Romanovich Alekno', 29);
  var role = PlayerRole('Opposite hitter',
      'An opposite hitter, also know as a right-side hitter, \nis considered the most versatile because they can \nexcel on offense and defense.');

  print('Player Info:');
  player.displayInfo();

  print('\nCoach Info:');
  coach.displayInfo();

  print('\nPlayer Info:');
  print('Name: ${role.name}');
  print('Description: ${role.description}');
}
