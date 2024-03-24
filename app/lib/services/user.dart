import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Update user password
  Future<void> updatePassword(String newPassword) async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.updatePassword(newPassword);
    }
    throw Exception('No user is currently signed in.');
  }

  // Update user email
  Future<void> updateEmail(String newEmail) async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.updateEmail(newEmail);
    }
    throw Exception('No user is currently signed in.');
  }

  // Delete user
  Future<void> deleteUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.delete();
    }
    throw Exception('No user is currently signed in.');
  }

  // Sign out user
  Future<void> signOut() {
    return _auth.signOut();
  }
}