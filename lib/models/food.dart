class Food {
  final String imagePath;
  String? gifPath;
  final String name;
  final String description;
  final int minute;
  final double price;
  final String describe; // Long description
  bool isFav; // Favorite flag

  Food({
    required this.imagePath,
    this.gifPath,
    required this.name,
    required this.minute,
    required this.description,
    required this.price,
    required this.describe,
    this.isFav = false, // default value is false
  });
}
