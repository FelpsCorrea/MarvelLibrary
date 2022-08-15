class VerificationsUtils {
  static bool isNotEmpty(String? value) {
    if (value != null && value != "" && value != "[]" && value != "{}") {
      return true;
    }
    return false;
  }
}
