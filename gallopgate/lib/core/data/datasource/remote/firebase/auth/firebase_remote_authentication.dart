import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:gallopgate/core/domain/datasource/auth/i_auth_remote_datasource.dart';
import 'package:gallopgate/core/domain/models/model_user.dart';

class FirebaseRemoteAuthentication extends IAuthRemoteDatasource {

  FirebaseRemoteAuthentication(this.firebaseAuth);

  final firebase_auth.FirebaseAuth firebaseAuth;

  User? _user;

  @override
  User? get currentUser => _user;


  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    var credentaials = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return fromFirebaseUser(credentaials.user);
  }

  @override
  Future<void> logout() {
    _user = null;
    return firebaseAuth.signOut();
  }

  @override
  Future<User?> signupWithEmailAndPassword(String email, String password) async {
    var credentaials = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return fromFirebaseUser(credentaials.user);
  }

  User? fromFirebaseUser(firebase_auth.User? user) {
      if (user != null) {
        _user = User(uid: user.uid, email: user.email!);
      } else {
        _user = null;
      }

      return _user;
  }
  
}