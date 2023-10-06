int calculate() {
  print(getUrl(DateTime.timestamp()));

  return 6 * 7;
}

//  GET https://www.elprisenligenu.dk/api/v1/prices/[ÅR]/[MÅNED]-[DAG]_[PRISKLASSE].json
String getUrl(DateTime day) => 'https://www.elprisenligenu.dk/api/v1/prices/'
    '${day.year}/'
    '${day.month.toString().padLeft(2, '0')}-'
    '${day.day.toString().padLeft(2, '0')}_DK1.json';

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
}

Iterable<(U, V)> zip<U, V>(Iterable<U> one, Iterable<V> two) sync* {
  final i1 = one.iterator, i2 = two.iterator;

  while (i1.moveNext() && i2.moveNext()) {
    yield (i1.current, i2.current);
  }
}