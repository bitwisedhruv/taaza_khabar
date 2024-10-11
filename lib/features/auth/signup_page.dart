import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taaza_khabar/features/auth/auth_provider.dart';
import 'package:taaza_khabar/features/auth/login_page.dart';
import 'package:taaza_khabar/features/auth/widgets/auth_button.dart';
import 'package:taaza_khabar/features/auth/widgets/auth_field.dart';
import 'package:taaza_khabar/palette.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userAuthProvider = Provider.of<UserAuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyNews",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppPalette.blueColor,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20)
            .copyWith(top: 112),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthField(
              authFieldText: "Name",
              controller: nameController,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 12,
            ),
            AuthField(
              authFieldText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 12,
            ),
            AuthField(
              authFieldText: "Password",
              controller: passwordController,
              isObscure: true,
              keyboardType: TextInputType.text,
            ),
            const Spacer(),
            AuthButton(
              data: "Signup",
              onPressed: () async {
                await userAuthProvider.createNewUserWithEmailAndPassword(
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  context: context,
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppPalette.blueColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
