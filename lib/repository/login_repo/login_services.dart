abstract class LoginServices {

  Future<void> signInPhone(Map<String, dynamic> data);
  Future<void> signInGoogle();
  Future<void> signInCoachCode(Map<String, dynamic> data);
  Future<void> otpVerify(Map<String,dynamic> data);
  Future<void> coachRegister(Map<String,dynamic> data);

}