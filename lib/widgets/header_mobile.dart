import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class HeaderMobile extends StatelessWidget {

  const HeaderMobile({super.key, this.onMenuTap});

  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(40, 5, 0, 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, CustomColor.bgLight1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Row(
        children: [
          Text(
            "ĐÀO ĐẠI HẢI",
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu)),
        ],
      ),
    );
  }
}
