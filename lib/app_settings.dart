enum Units {
  Imperial,
  Metric,
}

class AppSettings {
  int smGroupDistance;
  Units? units;
  bool useKnots;
  String topMsg;
  String bottomMsg;

  AppSettings({
    required this.smGroupDistance,
    required this.units,
    required this.useKnots,
    required this.topMsg,
    required this.bottomMsg,
  });
}
