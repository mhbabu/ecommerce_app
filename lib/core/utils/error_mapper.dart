class ErrorMapper {
  static String getErrorMessage(dynamic error) {
    if (error == null) return "Unknown error occurred";

    final message = error.toString().toLowerCase();

    if (message.contains('timeout')) {
      return "Connection timeout. Please try again.";
    } else if (message.contains('socket')) {
      return "No internet connection.";
    } else if (message.contains('unauthorized')) {
      return "Invalid credentials.";
    } else if (message.contains('404')) {
      return "Resource not found.";
    } else if (message.contains('500')) {
      return "Server error. Please try later.";
    } else {
      return "Something went wrong. Please try again.";
    }
  }
}


// uses
// try {
//   await apiService.get(...);
// } catch (e) {
//   final message = ErrorMapper.getErrorMessage(e);
//   print(message);
// }