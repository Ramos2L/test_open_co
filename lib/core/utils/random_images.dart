import 'dart:math';

import '../ui/styles/images.dart';

class RandomImages {
  static String images() {
    List<String> images = [
      Images.i.baby,
      Images.i.barista,
      Images.i.home,
      Images.i.love,
      Images.i.posts,
      Images.i.traveling,
      Images.i.users,
      Images.i.wedding,
      Images.i.woman,
      Images.i.researching,
    ];

    var length = images.length;
    var randomImage = Random().nextInt(length);
    return images[randomImage];
  }
}
