import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/utils/trl.dart';
import 'package:spotify_clone/features/auth/forgot_password/forgot_password.dart';
import 'package:spotify_clone/features/auth/login_register/login_register.dart';
import 'package:spotify_clone/features/auth/register/register.dart';
import 'package:spotify_clone/features/auth/sign_in/sign_in.dart';
import 'package:spotify_clone/features/onboarding/get_started/get_started_view.dart';
import 'package:spotify_clone/features/onboarding/choose_mode/choose_mode_view.dart';
import 'package:spotify_clone/features/onboarding/splash_screen/splash_screen_view.dart';
import 'package:spotify_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (kDebugMode) {
      print("Firebase-Initialisierung fehlgeschlagen: $e");
    }
    return;
  }
  await loadTranslations('de');
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreenWrapper(),
    ),
    GoRoute(
      path: '/get-started',
      builder: (context, state) => const GetStartedView(),
    ),
    GoRoute(
      path: '/choose-mode',
      builder: (context, state) => const ChooseModeView(),
    ),
    GoRoute(
      path: '/login-register',
      builder: (context, state) => const LoginRegisterScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen())
  ],
);

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.go('/get-started');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentLanguage,
      builder: (context, lang, _) {
        return MaterialApp.router(
          routerConfig: _router,
          title: trl('title'),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
