import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../shared/utils.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> guestLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      if (await FirestoreService().userDocExists() == false) {
        String? uid = FirebaseAuth.instance.currentUser!.uid;
        FirestoreService().addUser(uid, '', '', '');
      }
    } on FirebaseAuthException catch (e) {
      Utils.showErrorAlert(e.message);
    }
  }

  Future<void> emailSignUp(
      String email, String password, String firstName, String lastName) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (await FirestoreService().userDocExists() == false) {
        String? uid = FirebaseAuth.instance.currentUser!.uid;
        FirestoreService().addUser(uid, firstName, lastName, email);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Utils.showErrorAlert(
            "You have already registered.\nClick the link above to log in.");
      } else {
        Utils.showErrorAlert(e.message);
      }
    }
  }

  Future<void> emailSignIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showErrorAlert(
            'Email address not found.\nClick the link above to register.');
      } else if (e.code == 'wrong-password') {
        Utils.showErrorAlert(
            'Incorrect password.\nPlease try again or click reset password if you have forgotten your password.');
      } else {
        Utils.showErrorAlert(e.message);
      }
    }
  }

  //Sign in with Google and creates
  //a user profile in the database if it is their first login.
  Future<void> googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(authCredential);

      if (await FirestoreService().userDocExists() == false) {
        String? name = FirebaseAuth.instance.currentUser!.displayName;
        List<String> fullName = name!.split(' ');
        String firstName = fullName[0];
        String lastName = fullName[1];
        String? email = FirebaseAuth.instance.currentUser!.email;
        String? uid = FirebaseAuth.instance.currentUser!.uid;
        FirestoreService().addUser(uid, firstName, lastName, email!);
      }
    } on FirebaseAuthException catch (e) {
      Utils.showErrorAlert(e.message);
    }
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      if (await FirestoreService().userDocExists() == false) {
        String? uid = FirebaseAuth.instance.currentUser!.uid;
        FirestoreService().addUser(uid, appleCredential.givenName!,
            appleCredential.familyName!, appleCredential.email!);
      }
    } on FirebaseAuthException catch (e) {
      Utils.showErrorAlert(e.message);
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Utils.showErrorAlert(e.message);
    }
  }

  Future<void> forgottenPassword(email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Utils.showSuccessAlert(
          'Please check your email for instructions to reset your password.\n\nRemember to check your spam folder.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showErrorAlert("No account found with this email address.");
      } else {
        Utils.showErrorAlert(e.message);
      }
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      Utils.showErrorAlert(e.message);
    }
  }
}
