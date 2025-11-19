class Pet {
  final String name;
  final String photoUrl;
  final String localAssetAlt; // ex.: ’assets/images/pet.png’
  final String size; // ’pequeno’ | ’medio’ | ’grande’
  final String temperament;

  const Pet({
  required this.name,
  required this.photoUrl,
  required this.localAssetAlt,
  required this.size,
  required this.temperament,
  });


}