class CarDto {
  final String photo;
  final String brand;
  final int kilometer;
  final int horsepower;
  final int authorId;
  final String description;

  CarDto({
    required this.photo,
    required this.brand,
    required this.kilometer,
    required this.horsepower,
    required this.authorId,
    required this.description,
  });
}
