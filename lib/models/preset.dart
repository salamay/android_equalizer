
class Preset {
  Preset({
      required this.presetName,
      required this.presetId,
  });

  Preset.fromJson(dynamic json) {
    presetName = json['presetName'];
    presetId = json['presetId'];
  }
  String? presetName;
  int? presetId;
Preset copyWith({
  String? presetName,
  int? presetId,
}) => Preset(  presetName: presetName ?? this.presetName,
  presetId: presetId ?? this.presetId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['presetName'] = presetName;
    map['presetId'] = presetId;
    return map;
  }

}