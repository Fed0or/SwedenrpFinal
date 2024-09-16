import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/shared/rounded_button.dart';
import 'package:sweden_roleplay/screens/authentication/login.dart';
import 'package:sweden_roleplay/screens/authentication/signup.dart';

import '../../shared/social_login_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Changed background to black
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 350,
                          child: Image.asset(
                            "assets/icons/logo.png",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      const Center(
                        child: Text(
                          "",
                          style: TextStyle(
                            color: Color(0xFFCB6CE6), // Custom color
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: SocialLoginButton(
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RoundedButton(
                text: "Logga in",
                color: Colors.white12,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              RoundedButton(
                text: "Registerera",
                color: kPrimaryColor,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
