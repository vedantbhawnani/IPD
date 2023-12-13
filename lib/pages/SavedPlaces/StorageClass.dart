class SavedPlace {
  final String name;
  final String? description;
  final String? category;
  final String mapThumbnailUrl;
  final double latitude;
  final double longitude;

  const SavedPlace({
    required this.name,
    this.description,
    this.category,
    required this.mapThumbnailUrl,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'category': category,
    'mapThumbnailUrl': mapThumbnailUrl,
    'latitude': latitude,
    'longitude': longitude,
  };

  static fromJson(Map<String, dynamic> json) {}
}
