import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taaza_khabar/features/auth/auth_provider.dart';
import 'package:taaza_khabar/features/auth/signup_page.dart';
import 'package:taaza_khabar/features/home/home_page.dart';
import 'package:taaza_khabar/firebase_options.dart';
import 'package:taaza_khabar/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserAuthProvider(
            auth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppPalette.theme,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppPalette.blueColor,
                ),
              );
            }
            if (snapshot.data != null) {
              return const HomePage();
            }
            return const SignupPage();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
