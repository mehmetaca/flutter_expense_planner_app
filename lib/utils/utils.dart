import 'dart:math';
import 'package:intl/intl.dart';

int getRandomId() {
  return Random().nextInt(1000000);
}

String getFormattedDate(DateTime dt)
{
  return DateFormat('dd MMM - EEEE').format(dt);
}

String getDayName(DateTime dt)
{
  return DateFormat.E().format(dt);
}
