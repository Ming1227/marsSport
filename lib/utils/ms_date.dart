bool timeDiffDays(int milliSecond) {
  final cur = DateTime.now();
  final last = DateTime.fromMillisecondsSinceEpoch(milliSecond);
  final hoursDif = cur.difference(last).inHours;
  if (hoursDif > 24) {
    return true;
  } else {
    return false;
  }
}
