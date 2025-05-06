import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/constants/constants.dart';
import 'package:spotify_clone/features/auth/widgets/shared_auth_widgets.dart';
import 'package:spotify_clone/core/utils/trl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TapGestureRecognizer _tapRecognizer;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        context.go('/sign-in');
      };
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError('Bitte alle Felder ausfüllen.');
      return;
    }

    if (!_isValidEmail(email)) {
      _showError('Bitte gib eine gültige E-Mail-Adresse ein.');
      return;
    }

    if (password.length < 6) {
      _showError('Das Passwort muss mindestens 6 Zeichen lang sein.');
      return;
    }

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    debugPrint('Registrierung erfolgreich: $email');
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
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
                    context.go('/sign-in');
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
                  trl('register.headline'),
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
                    text: trl('register.subtitle_1'),
                    style: const TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: trl('register.subtitle_2'),
                        style: const TextStyle(color: AppColors.linkBlue),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              InputField(hint: 'Enter Email', controller: _emailController),
              const SizedBox(height: 16),
              InputField(
                  hint: 'Password',
                  obscureText: true,
                  controller: _passwordController),
              const SizedBox(height: 24),
              GreenButton(
                text: trl('register.headline'),
                onPressed: _register,
              ),
              const SizedBox(height: 16),
              const DividerWithText(),
              const SizedBox(height: 16),
              const LoginIcons(),
              const SizedBox(height: 16),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: trl('register.have_account'),
                    style: const TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: trl('register.sign_in'),
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
