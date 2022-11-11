import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'widgets/app_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                home: Scaffold(
                    appBar: const CustomAppBar(),
                    body: const Center(
                      child: Text("Hello"),
                    ),
                    drawer: Drawer(
                        child:
                            ListView(padding: EdgeInsets.zero, children: const [
                      SizedBox(
                        height: 128,
                        child: DrawerHeader(
                            decoration: BoxDecoration(
                              color: Color(0xFF003865),
                            ),
                            child: Text('Drawer Header')),
                      ),
                      ListTile(title: Text('Item 1'))
                    ]))));
          }
          return const Text('loading');
        });
  }
}
