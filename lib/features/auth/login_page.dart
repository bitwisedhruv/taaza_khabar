import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taaza_khabar/features/auth/auth_provider.dart';
import 'package:taaza_khabar/features/auth/signup_page.dart';
import 'package:taaza_khabar/features/auth/widgets/auth_button.dart';
import 'package:taaza_khabar/features/auth/widgets/auth_field.dart';
import 'package:taaza_khabar/palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
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
            .copyWith(top: 180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              keyboardType: TextInputType.text,
              isObscure: true,
            ),
            const Spacer(),
            AuthButton(
              data: "Login",
              onPressed: () async {
                await userAuthProvider.signInWithUsernameAndPassword(
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
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "New Here? ",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                  children: [
                    TextSpan(
                      text: "Signup",
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
