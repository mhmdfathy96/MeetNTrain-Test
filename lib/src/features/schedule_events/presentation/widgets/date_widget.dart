import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/src/core/utils/media_query_values.dart';


class DateWidget extends StatelessWidget {
  final DateTime dateTime;
  const DateWidget({super.key, required this.dateTime});

 String get month{
  List<String> dateSplited= DateFormat.yMMMMEEEEd().format(dateTime).split(" ");
    return '${dateSplited[1]} ${dateSplited.last}';
  }

  String get day{
    return DateFormat.yMMMMEEEEd().format(dateTime).split(',')[0];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          dateTime.day.toString(),
          style: textTheme.headline1,
        ),
        SizedBox(
          width: context.width * .02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             day,
              style: textTheme.headline3,
            ),
            Text(
              month,
              style: textTheme.headline2
            ),
          ],
        )
      ],
    );
  }
}
