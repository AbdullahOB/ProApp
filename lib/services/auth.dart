import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserId? _userFromFirebaseUser(User user) {
    return user != null ? UserId(uid: user.uid) : null;
  }
//sign in With Google (Later)

//sign in with email and password

//register with email and password
  Future registerWithEmailPassword(String Email, String Pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Pass);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign out

}
