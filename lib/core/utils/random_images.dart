import 'dart:math';

class RandomImages {
  static String images() {
    List<String> images = [
      "assets/images/undraw_baby.svg",
      "assets/images/undraw_barista.svg",
      "assets/images/undraw_home.svg",
      "assets/images/undraw_love.svg",
      "assets/images/undraw_posts.svg",
      "assets/images/undraw_traveling.svg",
      "assets/images/undraw_users.svg",
      "assets/images/undraw_wedding.svg",
      "assets/images/undraw_woman.svg",
      "assets/images/undraw_researching.svg",
    ];

    var length = images.length;
    var randomImage = Random().nextInt(length);
    return images[randomImage];
  }
}
