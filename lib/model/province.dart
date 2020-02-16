class Province {
  final num area;
  final num density;
  final String id;
  final String iso;
  final String name;
  final String nameKh;
  final String photoUrl;
  final num population;

  Province(
      {this.area,
      this.density,
      this.id,
      this.iso,
      this.name,
      this.nameKh,
      this.photoUrl,
      this.population});

  factory Province.from(data) {
    return new Province(
        area: data['area'] ?? 0,
        density: data['density'] ?? 0,
        id: data['id'] ?? "",
        iso: data['iso'] ?? "",
        name: data['name'] ?? "",
        nameKh: data['nameKh'] ?? "",
        photoUrl: data['photoUrl'] ?? "",
        population: data['population'] ?? 0);
  }
}
