import 'package:flutter/material.dart';
import 'package:test_project/src/core/utils/media_query_values.dart';

import '../../../../core/utils/constant.dart';
import '../../domain/entities/user.dart';

class UserCircleWidget extends StatelessWidget {
  final User user;
  const UserCircleWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(.5),
        child: ClipOval(
          child: Image.network(
            Constant.imageNetwork(
              context,
              imageKey:user.profilePicture,
            ),
          ),
        ),
      ),
    );
  }
}
