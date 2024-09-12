import 'package:flutter/material.dart';
import 'package:streamingapp/utils/constants.dart';
import 'package:streamingapp/shared/rounded_button.dart';
import 'package:streamingapp/shared/custom_field.dart';
import 'package:streamingapp/screens/authentication/login.dart';
import 'package:streamingapp/screens/master.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Registerera",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomField(
                        label: "Email",
                        iconData: Icons.mail_outline,
                      ),
                      CustomField(
                        label: "Användarnamn",
                        iconData: Icons.person_outline,
                      ),
                      CustomField(
                        label: "Lösenord",
                        iconData: Icons.remove_red_eye,
                      ),
                      CustomField(
                        label: "Födelsedatum",
                        iconData: Icons.cake,
                      ),
                    ],
                  ),
                ),
              ),
              RoundedButton(
                text: "Har ingen konto?",
                color: Colors.transparent,
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
                    MaterialPageRoute(builder: (context) => const Master()),
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
