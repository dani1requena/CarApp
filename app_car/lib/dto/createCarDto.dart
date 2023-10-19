
class CreateCarDto {
  final String photo;
  final String brand;
  final int kilometer;
  final int horsepower;
  final int authorId;
  final String description;

  CreateCarDto({
    required this.photo,
    required this.brand,
    required this.kilometer,
    required this.horsepower,
    required this.authorId,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'photo': photo,
      'brand': brand,
      'kilometer': kilometer,
      'horsepower': horsepower,
      'authorId': authorId,
      'description': description,
    };
  }

  factory CreateCarDto.fromJson(Map<String, dynamic> json) {
    return CreateCarDto(
      photo: json['photo'],
      brand: json['brand'],
      kilometer: json['kilometer'],
      horsepower: json['horsepower'],
      authorId: json['authorId'],
      description: json['description'],
    );
  }
}