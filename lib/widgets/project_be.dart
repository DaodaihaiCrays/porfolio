import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constaints/colors.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectBE extends StatefulWidget {
  const ProjectBE({super.key, required this.projectBEItem});

  final ProjectBEItem projectBEItem;

  @override
  State<ProjectBE> createState() => _ProjectBEState();
}

class _ProjectBEState extends State<ProjectBE> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề + GitHub icon với hover
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => isHovering = true),
            onExit: (_) => setState(() => isHovering = false),
            child: GestureDetector(
              onTap:() {
                launchUrlString(widget.projectBEItem.link);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.projectBEItem.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isHovering
                          ? CustomColor.yellowPrimary
                          : Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      "assets/github.svg",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),

          // Description
          for (int i = 0; i < widget.projectBEItem.description.length; i++)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•  ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Expanded(
                  child: Text(
                    widget.projectBEItem.description[i],
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ),
              ],
            ),

          // Technologies
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('•  ', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text(
                "Technologies: ",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              for (int i = 0; i < widget.projectBEItem.technologies.length; i++)
                Container(
                  margin: EdgeInsets.only(left: 10),
                  color: Colors.white,
                  child: SvgPicture.asset(
                    widget.projectBEItem.technologies[i],
                    width: 30,
                    height: 30,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
