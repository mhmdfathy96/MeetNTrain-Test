class EndPoints {
  static const String baseUrl = "http://test.meetntrain.com/v1/";
  static int userId = 8357;
  static String upComingEvents =
      '${baseUrl}profile/events/upcoming/${userId.toString()}';
} 