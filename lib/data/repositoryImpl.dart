import 'package:firebase_auth/firebase_auth.dart';

import '../domain/repository.dart';

class RepositoryImpl implements Repository {
  @override
  String? verificationId;

  @override
  Future<bool> isUserCodeVerified(String verificationId, String smsCode) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Create a PhoneAuthCredential using the verification ID and the user-provided SMS code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      // Sign in the user with the credential
      await auth.signInWithCredential(credential);
      print('User signed in successfully');
      return true;
    } catch (e) {
      // Handle verification failure
      print('Verification failed: $e');
      return false;
    }
  }

  @override
  void registerUserWithPhoneNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // This callback will be triggered automatically if the verification is completed instantly.
        // You can use the credential to sign in the user.
        await auth.signInWithCredential(credential);
        print('User signed in successfully');
      },
      verificationFailed: (FirebaseAuthException e) {
        // This callback will be triggered if the verification process encounters an error.
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // This callback will be triggered when the verification code is successfully sent to the user's phone.
        // You can save the verification ID and use it later to authenticate the user.
        this.verificationId = verificationId;
        print('Verification code sent to $phoneNumber');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // This callback will be triggered when the verification code auto-retrieval times out.
        // You can handle this case if needed.
        print('Verification code auto-retrieval timeout');
      },
    );
  }
}
// will register the new user with his phone number
// in db i will create the id of the user and save his number
// id will never change when number can
// when send a number to the db, should return a code and
// remember it in the db
// than user sends a code and a number is got again, so
//i should check codes and if they match, save user to db
