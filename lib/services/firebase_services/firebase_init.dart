import 'package:firebase_core/firebase_core.dart';

class FirbaseService {
  Future<FirebaseApp> initFirebase() async {
    return await Firebase.initializeApp();
  }
}
