String msGetCurrentDay() => msGetStrFromDate(DateTime.now());

String msGetStrFromDate(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year$month$day';
}

bool msTimeDiffDays(int milliSecond) {
  final cur = DateTime.now();
  final last = DateTime.fromMillisecondsSinceEpoch(milliSecond);
  final hoursDif = cur.difference(last).inHours;
  if (hoursDif > 24) {
    return true;
  } else {
    return false;
  }
}
