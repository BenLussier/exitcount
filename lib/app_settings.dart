enum Units {
  Imperial,
  Metric,
}

class AppSettings {
  int smGroupDistance;
  Units? units;
  bool useKnots;
  String topMsg;
  String middleMsg;
  String bottomMsg;

  AppSettings({
    required this.smGroupDistance,
    required this.units,
    required this.useKnots,
    required this.topMsg,
    required this.middleMsg,
    required this.bottomMsg,
  });
}
