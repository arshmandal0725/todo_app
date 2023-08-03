import 'package:intl/intl.dart';


final formatter = DateFormat.yMd();

enum Category { workout, study, sleep, worship, eating, otherWork }

class ToDo {
  const ToDo(
      {required this.title,
      required this.duration,
      required this.work,
      required this.date});

  final String title;
  final double duration;
  final Category work;
  final DateTime date;

get format{
  return formatter.format(date);
}
}
