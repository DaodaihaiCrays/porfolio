import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // nếu bạn dùng SVG icon
import 'package:url_launcher/url_launcher_string.dart';

class ButtonConnect extends StatelessWidget {
  const ButtonConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // GitHub icon (SVG hoặc Image.asset)
        SvgPicture.asset(
          'assets/github.svg', // hoặc dùng Icons nếu có sẵn
          width: 20,
          height: 20,
        ),
        SizedBox(width: 10),

        // Text
        Text('Github', style: TextStyle(color: Colors.white, fontSize: 16)),

        Spacer(), // đẩy icon bên phải ra xa
        // External link icon (mở tab mới)
        Icon(Icons.open_in_new_rounded, color: Colors.white, size: 18),
      ],
    );
  }
}
