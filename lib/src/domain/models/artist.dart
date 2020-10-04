class Artist {
  String name;
  Artist(this.name);

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
