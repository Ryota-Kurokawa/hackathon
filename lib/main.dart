import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon/pages/search_page.dart';
import 'package:hackathon/pages/signup_page.dart';
import 'pages/login_page.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hackathon/widgets/matching_card.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: '.env'); // .envの読み込み
  const scope = ProviderScope(
    child: Start(),
  );
  runApp(scope);
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< Updated upstream
      home: loginPage(),
=======
      home: Runner(),
>>>>>>> Stashed changes
    );
  }
}

class Config extends HookWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogin = useState(false);
    useEffect(() {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        isLogin.value = true;
      }
      return;
    });
    return isLogin.value ? searchPage() : loginPage();
  }
}
