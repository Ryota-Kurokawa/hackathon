import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authenticator {
  // インスタンス変数 _firebaseAuthを作成しその中にFirebaseAuth.instanceを打ち込む
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;

  // サインアップのメソッドを作る
  static Future<dynamic> signUp(
      //必要な引数の設定
      {required String email,
      required String password}) async {
    // それが失敗した時と失敗していない時の処理をtry、catch文で書く
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseAnalytics.instance.logEvent(name: 'create account');
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> emailSignIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
