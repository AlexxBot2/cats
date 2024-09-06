import 'package:cats/features/cat/data/models/cat_weight.dart';

class Cat {
  final String id;
  final String name;
  final CatWeight weight;
  final String temperament;
  final String origin;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int evergyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final int hypoallergenic;
  final String imagePath;

  const Cat({
    required this.id,
    required this.name,
    required this.weight,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.evergyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.hypoallergenic,
    required this.imagePath,
  });

  factory Cat.fromJson(Map<dynamic, dynamic> json) {
    return Cat(
      id: json['id'].toString(),
      name: json['name'].toString(),weight: CatWeight.fromJson(json['weight']),
      temperament: json['temperament'].toString(),
      origin: json['origin'].toString(),
      description: json['description'].toString(),
      lifeSpan: json['life_span'].toString(),
      indoor: int.tryParse(json['indoor'].toString()) ?? 0,
      lap: int.tryParse(json['lap'].toString()) ?? 0,
      altNames: json['alt_names'].toString(),
      adaptability: int.tryParse(json['adaptability'].toString()) ?? 0,
      affectionLevel: int.tryParse(json['affection_level'].toString()) ?? 0,
      childFriendly: int.tryParse(json['child_friendly'].toString()) ?? 0,
      dogFriendly: int.tryParse(json['dog_friendly'].toString()) ?? 0,
      evergyLevel: int.tryParse(json['energy_level'].toString()) ?? 0,
      grooming: int.tryParse(json['grooming'].toString()) ?? 0,
      healthIssues: int.tryParse(json['health_issues'].toString()) ?? 0,
      intelligence: int.tryParse(json['intelligence'].toString()) ?? 0,
      sheddingLevel: int.tryParse(json['shedding_level'].toString()) ?? 0,
      socialNeeds: int.tryParse(json['social_needs'].toString()) ?? 0,
      strangerFriendly: int.tryParse(json['stranger_friendly'].toString()) ?? 0,
      vocalisation: int.tryParse(json['vocalisation'].toString()) ?? 0,
      experimental: int.tryParse(json['experimental'].toString()) ?? 0,
      hairless: int.tryParse(json['hairless'].toString()) ?? 0,
      natural: int.tryParse(json['natural'].toString()) ?? 0,
      rare: int.tryParse(json['rare'].toString()) ?? 0,
      rex: int.tryParse(json['rex'].toString()) ?? 0,
      suppressedTail: int.tryParse(json['suppressed_tail'].toString()) ?? 0,
      shortLegs: int.tryParse(json['short_legs'].toString()) ?? 0,
      hypoallergenic: int.tryParse(json['hypoallergenic'].toString()) ?? 0,
      imagePath: json['reference_image_id'].toString(),
    );
  }
}
