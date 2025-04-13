import 'package:flutter/material.dart';
import 'package:portfolio/constaints/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/avt_profile.jpeg",
              width: screenSize.width / 2,
              height: screenSize.height / 5,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Hi,\n"
                  "My name is Đào Đại Hải. I graduated from University of Science. My major is Software Engineering. "
                  "I have experience in developing Backend and Mobile Applications. "
                  "With logical thinking skills and a creative mindset, I want to become one of the members "
                  "who bring effective solutions to the customers. At the same time, I want to improve my "
                  "knowledge in your professional working environment.",
              style: TextStyle(
                fontSize: 20,
                color: CustomColor.textFieldBg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
