import 'package:final_project/cubits/get_books_cubit/get_books_cubit.dart';
import 'package:final_project/views/login_view.dart';
import 'package:final_project/views/main_view.dart';
import 'package:final_project/views/onboarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(BooksApp(showHome: showHome));
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key, required this.showHome});
  final bool showHome;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetBooksCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            useMaterial3: false,
          ),
          home: !showHome
              ? const OnboardingView()
              : (FirebaseAuth.instance.currentUser == null)
                  ? const LoginView()
                  : const MainView(),
        ));
  }
}
