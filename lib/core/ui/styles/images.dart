class Images {
  static Images? _instance;

  Images._();

  static Images get i {
    _instance ??= Images._();
    return _instance!;
  }

  String get baby => "assets/images/undraw_baby.svg";
  String get barista => "assets/images/undraw_barista.svg";
  String get home => "assets/images/undraw_home.svg";
  String get love => "assets/images/undraw_love.svg";
  String get posts => "assets/images/undraw_posts.svg";
  String get traveling => "assets/images/undraw_traveling.svg";
  String get users => "assets/images/undraw_users.svg";
  String get wedding => "assets/images/undraw_wedding.svg";
  String get woman => "assets/images/undraw_woman.svg";
}