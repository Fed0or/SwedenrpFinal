import 'package:flutter/material.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/shared/rounded_button.dart';
import 'package:sweden_roleplay/shared/custom_field.dart';
import 'package:sweden_roleplay/screens/master.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                  "Logga in",
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
                        label: "Lösenord",
                        iconData: Icons.remove_red_eye,
                      ),
                    ],
                  ),
                ),
              ),
              RoundedButton(
                text: "Logga in",
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
