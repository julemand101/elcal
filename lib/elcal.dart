int calculate() {
  print(getUrl(DateTime.timestamp()));

  return 6 * 7;
}

//  GET https://www.elprisenligenu.dk/api/v1/prices/[ÅR]/[MÅNED]-[DAG]_[PRISKLASSE].json
String getUrl(DateTime day) => 'https://www.elprisenligenu.dk/api/v1/prices/'
    '${day.year}/'
    '${day.month.toString().padLeft(2, '0')}-'
    '${day.day.toString().padLeft(2, '0')}_DK1.json';
