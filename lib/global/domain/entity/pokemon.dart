class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final bool isFavorite;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
