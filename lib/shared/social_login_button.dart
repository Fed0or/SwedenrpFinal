import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: const Border.fromBorderSide(
                BorderSide(
                  color: Colors.white,
                ),
              )),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/google.png"),
                    Container(
                      height: 56,
                      width: 1,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const Expanded(
  flex: 4,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center, // Keeps text centered but allows padding
    children: [
      Padding(
        padding: EdgeInsets.only(right: 40.0), // Adjust this value to move more to the left
        child: Text(
          "Google logging",
          style: TextStyle(
            color: Color(0xFF585666),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    ],
  ),
),

            ],
          )),
    );
  }
}
