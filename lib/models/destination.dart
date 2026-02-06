class Destination {
  const Destination({
    required this.id,
    required this.title,
    required this.location,
    required this.rating,
    required this.pricePerNight,
    required this.description,
    required this.tags,
  });

  final String id;
  final String title;
  final String location;
  final double rating;
  final int pricePerNight;
  final String description;
  final List<String> tags;
}


