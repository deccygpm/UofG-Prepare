import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:l2_transition/routes.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/utils.dart';
import 'package:l2_transition/theme.dart';
import 'package:provider/provider.dart';

import 'services/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider(
              create: (_) => FirestoreService().streamReport(),
              initialData: Report(),
              child: MaterialApp(
                scaffoldMessengerKey: Utils.messengerKey,
                navigatorKey: navigatorKey,
                routes: appRoutes,
                theme: appTheme,
              ),
            );
          }
          return const Text(
            'loading',
            textDirection: TextDirection.ltr,
          );
        });
  }
}
