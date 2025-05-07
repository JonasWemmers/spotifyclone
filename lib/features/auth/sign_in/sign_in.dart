import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/constants/constants.dart';
import 'package:spotify_clone/features/auth/widgets/shared_auth_widgets.dart';
import 'package:spotify_clone/core/utils/trl.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TapGestureRecognizer _tapRecognizer;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        context.go('/register');
      };
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final auth = FirebaseAuth.instance;

    // Vor dem Login
    if (kDebugMode) {
      print('Vor dem Login: ${auth.currentUser}');
    }

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      if (kDebugMode) {
        print('Login erfolgreich: ${auth.currentUser?.email}');
      }

      if (!mounted) return;

      context.go('/choose-mode');
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Fehler beim Login: ${e.message}');
      }

      if (!mounted) return;

      _showError(e.message ?? 'Unbekannter Fehler beim Login');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  } else {
                    context.go('/login-register');
                  }
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: SvgPicture.asset('assets/logos/logo_spotify.svg'),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  trl('sign_in.headline'),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: trl('sign_in.subtitle_1'),
                    style: const TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: trl('sign_in.subtitle_2'),
                        style: const TextStyle(color: AppColors.linkBlue),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              InputField(
                hint: 'Enter Username Or Email',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              InputField(
                hint: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  text: trl('sign_in.recovery_password'),
                  style: const TextStyle(
                    color: AppColors.linkBlue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.push('/forgot-password');
                    },
                ),
              ),
              const SizedBox(height: 24),
              GreenButton(
                text: trl('sign_in.headline'),
                onPressed: _signIn,
              ),
              const SizedBox(height: 16),
              const DividerWithText(),
              const SizedBox(height: 16),
              const LoginIcons(),
              const SizedBox(height: 16),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: trl('sign_in.not_a_member'),
                    style: const TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: trl('sign_in.register_now'),
                        style: const TextStyle(color: AppColors.linkBlue),
                        recognizer: _tapRecognizer,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
