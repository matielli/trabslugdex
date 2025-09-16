class Slug {
  final int id;
  final String name;
  final String element;
  final String shotType;
  final String abilities;
  final String speed;
  final String strength;
  final String strategy;
  final String imageUrl;
  final String trivia;

  Slug({
    required this.id,
    required this.name,
    required this.element,
    required this.shotType,
    required this.abilities,
    required this.speed,
    required this.strength,
    required this.strategy,
    required this.imageUrl,
    required this.trivia,
  });

  factory Slug.fromJson(Map<String, dynamic> json) {
    return Slug(
      id: json['id'],
      name: json['name'],
      element: json['element'],
      shotType: json['shotType'],
      abilities: json['abilities'],
      speed: json['speed'],
      strength: json['strength'],
      strategy: json['strategy'],
      imageUrl: json['imageUrl'],
      trivia: json['trivia'],
    );
  }
}