class Place {
  final String id;
  final String name;
  final String description;
  final Map<dynamic, dynamic> geoPoint;
  final num hits;
  final String photoUrl;
  final String province;
  final Map<dynamic, dynamic> categories;
  final Map<dynamic, dynamic> savedBy;

  Place(
      {this.id,
      this.name,
      this.description,
      this.geoPoint,
      this.hits,
      this.photoUrl,
      this.province,
      this.categories,
      this.savedBy});

  factory Place.from(data) {
    return new Place(
        id: data['id'] ?? "",
        name: data['name'] ?? "",
        description: data['description'] ?? "",
        geoPoint: data['geoPoint'] ?? null,
        hits: data['hits'] ?? 0,
        photoUrl: data['photoUrl'] ?? "",
        province: data['province'] ?? "",
        categories: data['categories'] ?? null,
        savedBy: data['savedBy'] ?? null);
  }
}
