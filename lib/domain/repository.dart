abstract class Repository {
  String? verificationId;
  void registerUserWithPhoneNumber(String phoneNumber);
  Future<bool> isUserCodeVerified(String verificationId, String smsCode);
}
