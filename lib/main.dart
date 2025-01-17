import 'package:flutter/material.dart';
import 'package:momstart/screens/start/start.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Shell Navigator');

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartScreen(),
    ),
  ],
);

void main() async {
  await dotenv.load(fileName: "lib/assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     textTheme: const TextTheme(
    //       displaySmall: TextStyle(
    //         fontSize: 72,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //       displayMedium: TextStyle(
    //         fontSize: 72,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //       displayLarge: TextStyle(
    //         fontSize: 72,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //     ),
    //     useMaterial3: true,
    //   ),
    //   home: const StartScreen(),

    //   // home: MultiProvider(
    //   //   providers: [
    //   //     ChangeNotifierProvider(create: (context) => AuthState()),
    //   //     // other providers
    //   //   ],
    //   //   builder: (context, child) => MaterialApp(
    //   //     title: 'My Flutter App',
    //   //     theme: ThemeData(primarySwatch: Colors.indigo),
    //   //     home: Consumer<AuthState>(builder: (context, authState, _) {
    //   //       return authState.isAuthorized
    //   //           ? const HomeScreen()
    //   //           : FutureBuilder(
    //   //         future: authState.checkToken(),
    //   //         builder: (context, snapshot) =>
    //   //         snapshot.connectionState == ConnectionState.waiting
    //   //             ? const CircularProgressIndicator()
    //   //             : authState.displayedOnboard
    //   //             ? const LoginScreen()
    //   //             : const StartScreen(),
    //   //       );
    //   //     }),
    //   //   ),
    //   // ),
    // );
  }
}
