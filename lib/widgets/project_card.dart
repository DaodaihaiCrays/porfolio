import 'package:flutter/material.dart';
import 'package:portfolio/constaints/colors.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.projectUtils});

  final ProjectUtils projectUtils;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: () {
          launchUrlString(widget.projectUtils.link);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          clipBehavior: Clip.antiAlias,
          height: 300,
          width: 250,
          decoration: BoxDecoration(
            color: CustomColor.bgLight2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack ảnh + overlay mờ
              SizedBox(
                width: 250,
                height: 150,
                child: Stack(
                  children: [
                    Image.asset(
                      widget.projectUtils.image,
                      width: 250,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    AnimatedOpacity(
                      opacity: isHovering ? 0.3 : 0.0,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        width: 250,
                        height: 150,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  widget.projectUtils.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  widget.projectUtils.description,
                  style: TextStyle(
                    fontSize: 10,
                    color: CustomColor.whiteSecondary,
                  ),
                ),
              ),
              Spacer(),
              Container(
                color: CustomColor.bgLight1,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available on:",
                      style: TextStyle(
                        fontSize: 10,
                        color: CustomColor.yellowPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < widget.projectUtils.available.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              widget.projectUtils.available[i],
                              width: 20,
                              height: 20,
                              color: CustomColor.whiteSecondary,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
