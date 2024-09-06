class CatWeight {
  final String imperial;
  final String metric;

  CatWeight({required this.imperial, required this.metric});


  factory CatWeight.fromJson(Map<dynamic, dynamic> json) {
    return CatWeight(
      imperial: json['imperial'].toString(),
      metric: json['metric'].toString());
  }


}