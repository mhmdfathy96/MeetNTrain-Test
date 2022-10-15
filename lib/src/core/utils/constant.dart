import 'package:flutter/cupertino.dart';

class Constant {
  static String imageNetwork(BuildContext context,
      {required imageKey, double width = 0, double height = 0}) {
    return 'https://ik.imagekit.io/tnc8pizf9e/$imageKey?tr=w-$width,h-$height';
  }
}
