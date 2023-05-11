import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  static final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<bool> loginWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();

      if (account == null) return false;

      final authentication = await account.authentication;

      final creds = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(creds);

      return true;
    } catch (err) {
      return false;
    }
  }

  static Future<bool> logout() async {
    try {
      await _googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (err) {
      return false;
    }
  }
}
