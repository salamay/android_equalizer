

class Band {
  Band({
      this.min, 
      this.max,});
  int level=0;

  Band.fromJson(dynamic json) {
    min = json['min'];
    max = json['max'];
  }
  double? min;
  double? max;
Band copyWith({  double? min,
  double? max,
}) => Band(  min: min ?? this.min,
  max: max ?? this.max,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min'] = min;
    map['max'] = max;
    return map;
  }

}