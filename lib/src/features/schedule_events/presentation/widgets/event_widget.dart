import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/src/core/utils/media_query_values.dart';
import 'package:test_project/src/features/schedule_events/presentation/widgets/user_circle_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constant.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/user.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({super.key, required this.event});

  String get day {
    return DateFormat.MEd().format(event.date).split(',')[0];
  }

  int get daysLeft {
    return event.date.difference(DateTime.now()).inDays;
  }

  String get price {
    return event.price == 0 ? "Free" : 'AED ${event.price.toString()}';
  }

  int _position(User user) {
    return event.users.indexOf(user);
  }

  List<Widget> get users {
    List<Widget> users = [
      Container(),
    ];
    users.addAll(event.users.map(
      (user) => Positioned(
        left: _position(user) * 15,
        child: UserCircleWidget(
          user: user,
        ),
      ),
    ));
    return users;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: context.height * .36,
      width: context.width,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                VerticalDivider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: context.width * .03,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * .01,
                    vertical: context.width * .03,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.iconColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: context.width * .07,
                    minWidth: context.width * .07,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        event.date.day.toString(),
                        style:
                            textTheme.headline3!.copyWith(color: Colors.white),
                      ),
                      AutoSizeText(
                        day,
                        style: textTheme.headline5,
                        maxFontSize: 10,
                        minFontSize: 8,
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: context.width * .04),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500.withOpacity(.4),
                      spreadRadius: .4,
                      blurRadius: 1,
                      offset: const Offset(0, 5) // changes position of shadow
                      ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.width * .02),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: context.height * .2,
                            width: context.width * .75,
                            child: Image.network(
                                Constant.imageNetwork(context,
                                    imageKey: event.featuredImage),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.width * .02,
                              vertical: context.width * .01,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(.5),
                                    child: ClipOval(
                                      child: Image.network(
                                        Constant.imageNetwork(
                                          context,
                                          imageKey: event.tag.icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.width * .01,
                                ),
                                Text(
                                  event.tag.title,
                                  style: textTheme.headline6,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          bottom: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.width * .02,
                              vertical: context.width * .01,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${event.spots} Spots Left',
                              style: textTheme.headline6!.copyWith(
                                color: AppColors.iconColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * .02),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat("EEEE, d MMMM y .")
                                  .add_jm()
                                  .format(event.date),
                              style: textTheme.headline3!.copyWith(fontSize: 8),
                            ),
                            SizedBox(
                              width: context.width * .5,
                              child: AutoSizeText(
                                event.title,
                                style: textTheme.headline4!
                                    .copyWith(color: Colors.black),
                                maxFontSize: 10,
                                minFontSize: 8,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: SizedBox(
                                width: context.width * .7,
                                child: Text(
                                  event.placeName,
                                  style: textTheme.headline3!
                                      .copyWith(fontSize: 8),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.width * .73,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                             width: context.width * .45,
                                              child: Flex(
                                                direction: Axis.horizontal,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      '$daysLeft Days Left',
                                                      style:
                                                          textTheme.headline5!.copyWith(
                                                        color: AppColors.iconColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: context.height * .015,
                                            ),
                                            if (event.users.isNotEmpty)
                                              SizedBox(
                                                 width: context.width * .45,
                                                child: Stack(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                      clipBehavior:
                                                          Clip.none,
                                                      children: users,
                                                    ),
                                              ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                if (event.paymentMethod
                                                            .toLowerCase() ==
                                                        "cash" ||
                                                    event.paymentMethod
                                                            .toLowerCase() ==
                                                        "cash_online")
                                                  Icon(
                                                    Icons
                                                        .monetization_on_outlined,
                                                    color: AppColors.iconColor,
                                                    size: 18,
                                                  ),
                                                if (event.paymentMethod
                                                            .toLowerCase() ==
                                                        "online" ||
                                                    event.paymentMethod
                                                            .toLowerCase() ==
                                                        "cash_online")
                                                  Icon(
                                                    Icons.credit_card,
                                                    color: AppColors.iconColor,
                                                    size: 18,
                                                  ),
                                                if (event.paymentMethod
                                                            .toLowerCase() ==
                                                        "online" ||
                                                    event.paymentMethod
                                                            .toLowerCase() ==
                                                        "cash_online")
                                                  Icon(
                                                    Icons.wallet,
                                                    color: AppColors.iconColor,
                                                    size: 18,
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              price,
                                              style:
                                                  textTheme.headline4!.copyWith(
                                                color: AppColors.iconColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
