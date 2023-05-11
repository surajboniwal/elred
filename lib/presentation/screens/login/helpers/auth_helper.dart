import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  static final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<bool> loginWithGoogle() async {
    final account = await _googleSignIn.signIn();

    if (account == null) return false;

    return true;
  }
}
