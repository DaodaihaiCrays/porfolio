import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 200),
      height: screenSize.height / 2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Phần Text
          Expanded(
            flex: 3,
            child: SingleChildScrollView( // ✅ Nếu cần cuộn trong không gian nhỏ
              child: Text(
                "Hi,\n"
                "My name is Đào Đại Hải. I graduated from University of Science. My major is Software Engineering. "
                "I have experience in developing Backend and Mobile Applications. "
                "With logical thinking skills and a creative mindset, I want to become one of the members "
                "who bring effective solutions to the customers. At the same time, I want to improve my "
                "knowledge in your professional working environment.",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.textFieldBg,
                ),
                softWrap: true,
              ),
            ),
          ),

          const SizedBox(width: 20),

          // Phần Ảnh
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/avt_profile.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
