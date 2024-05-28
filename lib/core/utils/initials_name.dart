class InitialsName {
  static String nameUser({required String name}) {
    String? initials;

    final split = name.split(' ');

    if (split.length > 1 && split.last.isNotEmpty) {
      initials = split[0][0] + split[1][0];
    } else {
      initials = split[0][0] + split[0][1];
    }

    return initials;
  }
}