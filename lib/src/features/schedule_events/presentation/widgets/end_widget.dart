import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class EndWidget extends StatelessWidget {
  const EndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.hint,
            radius: 5,
          ),
        ),
      ],
    );
  }
}
