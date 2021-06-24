class Recipe {
  final int id;
  final String name;
  final String images;
  final String description;
  final int totalComics;
  final int totalSeries;

  Recipe(
      {this.id,
      this.name,
      this.images,
      this.description,
      this.totalComics,
      this.totalSeries});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        id: json['id'] as int,
        name: json['name'] as String,
        images: json['thumbnail']['path'] as String,
        description: json['description'] as String,
        totalComics: json['comics']['available'] as int,
        totalSeries: json['series']['available'] as int);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {id:$id ,name: $name, image: $images, description: $description, totalComics: $totalComics}, totalSeries: $totalSeries';
  }
}
