import 'package:flutter/material.dart';
import 'package:momstart/features/auth/view/login_screen.dart';
import 'package:momstart/screens/home/home.dart';
import 'package:momstart/screens/start/start.dart';
import 'package:provider/provider.dart';

import 'features/auth/viewModel/auth_provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "lib/assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          displaySmall:const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displayMedium:const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home:StartScreen(),
      // home: MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (context) => AuthState()),
      //     // other providers
      //   ],
      //   builder: (context, child) => MaterialApp(
      //     title: 'My Flutter App',
      //     theme: ThemeData(primarySwatch: Colors.indigo),
      //     home: Consumer<AuthState>(builder: (context, authState, _) {
      //       return authState.isAuthorized
      //           ? const HomeScreen()
      //           : FutureBuilder(
      //         future: authState.checkToken(),
      //         builder: (context, snapshot) =>
      //         snapshot.connectionState == ConnectionState.waiting
      //             ? const CircularProgressIndicator()
      //             : authState.displayedOnboard
      //             ? const LoginScreen()
      //             : const StartScreen(),
      //       );
      //     }),
      //   ),
      // ),
    );
  }
}


