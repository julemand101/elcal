class PricePeriod {
  final num dkkPerKWh;
  final num eurPerKWh;
  final num exr;
  final DateTime timeStart;
  final DateTime timeEnd;

  const PricePeriod({
    required this.dkkPerKWh,
    required this.eurPerKWh,
    required this.exr,
    required this.timeStart,
    required this.timeEnd,
  });

  factory PricePeriod.fromJson(Map<String, dynamic> jsonMap) => PricePeriod(
        dkkPerKWh: jsonMap['DKK_per_kWh'] as num,
        eurPerKWh: jsonMap['EUR_per_kWh'] as num,
        exr: jsonMap['EXR'] as num,
        timeStart: DateTime.parse(jsonMap['time_start'] as String),
        timeEnd: DateTime.parse(jsonMap['time_end'] as String),
      );

  static List<PricePeriod> fromJsonList(List<dynamic> jsonList) => [
        for (final jsonMap in jsonList)
          PricePeriod.fromJson(jsonMap as Map<String, dynamic>)
      ];

  @override
  String toString() {
    return 'PricePeriod{'
        'dkkPerKWh: $dkkPerKWh, '
        'eurPerKWh: $eurPerKWh, '
        'exr: $exr, '
        'timeStart: $timeStart, '
        'timeEnd: $timeEnd'
        '}';
  }
}
