enum Units {
  Imperial,
  Metric,
}

class AppSettings {
  int smGroupDistance;
  Units units;
  bool useKnots;
  String topMsg;
  String bottomMsg;

  AppSettings({
    this.smGroupDistance,
    this.units,
    this.useKnots,
    this.topMsg,
    this.bottomMsg,
  });
}
