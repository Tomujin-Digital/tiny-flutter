class Utils {
  static String getDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  static String getImagePath(String imageName, {String format = 'png'}) {
    return "assets/images/$imageName.$format";
  }
}
