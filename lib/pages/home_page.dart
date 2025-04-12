import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constaints/colors.dart';
import 'package:portfolio/constaints/nav_items.dart';
import 'package:portfolio/constaints/size.dart';
import 'package:portfolio/constaints/skill_items.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/widgets/button_connect.dart';
import 'package:portfolio/widgets/drawer_mobile.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/project_be.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController crollController = ScrollController();
  final List<GlobalKey> navbarKey = List.generate(4, (index) => GlobalKey());

  void scrollToSection(int navIndex) {
    // Lấy GlobalKey tương ứng từ danh sách navbarKeys
    final key = navbarKey[navIndex];

    // Scroll đến widget tương ứng
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer:
              constraints.maxWidth >= kDesktopWidth
                  ? null
                  : DrawerMobile(scaffoldKey: _scaffoldKey, onNavItemTap: (int navItem) {
                    _scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navItem);
                  },),
          body: SingleChildScrollView(
            controller: crollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // Main
                SizedBox(key: navbarKey.first),
                if (constraints.maxWidth >= kDesktopWidth)
                  HeaderDesktop(onNavItemTap: (int navItem) {
                    scrollToSection(navItem);
                  },)
                else
                  HeaderMobile(
                    onMenuTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
            
                SizedBox(height: 100),
            
                if (constraints.maxWidth >= kDesktopWidth)
                  MainDesktop()
                else
                  MainMobile(),
            
                SizedBox(height: 100),
            
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: CustomColor.bgLight1,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Education",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Image.asset(
                          "assets/logo-hcmus.png",
                          width: 400,
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "University of Science - Vietnam National University | Vietnam",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Bachelor of Science in Information Technology | 2020 - 2024",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            
                // Skill
                Container(
                  key: navbarKey[1],
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                  child: Column(
                    children: [
                      Text(
                        "What I can do",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Wrap(
                        children: [
                          for (int i = 0; i < skillsItems.length; i++)
                            Container(
                              width: 250,
                              constraints: BoxConstraints(maxWidth: 450),
                              margin: EdgeInsets.only(left: 20, top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: ListTile(
                                  leading:
                                      i == 1
                                          ? Image.asset(
                                            skillsItems[i]['img'],
                                            width: 30,
                                            height: 30,
                                          )
                                          : SvgPicture.asset(
                                            skillsItems[i]['img'],
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.cover,
                                          ),
                                  title: Center(
                                    child: Text(
                                      skillsItems[i]["name"],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
            
                // Project
                Container(
                  key: navbarKey[2],
                  padding: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  // color: CustomColor.bgLight1,
                  child: Column(
                    children: [
                      Text(
                        "Mobile Projects",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
            
                      Wrap(
                        children: [
                          for (int i = 0; i < mobileProject.length; i++)
                            ProjectCard(projectUtils: mobileProject[i]),
                        ],
                      ),
                      SizedBox(height: 50),
            
                      Text(
                        "Backend Projects",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
            
                      for (int i = 0; i < beProjects.length; i++)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: ProjectBE(projectBEItem: beProjects[i]),
                              ),
                            ),
                            if (i != beProjects.length - 1)
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: Divider(
                                    color: CustomColor.textFieldBg,
                                    thickness: 0.5,
                                  ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
            
                SizedBox(height: 20),
                // Contact
                Container(
                  key: navbarKey.last,
                  width: double.infinity,
                  color: CustomColor.bgLight1,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Connect",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
            
                      SizedBox(height: 20),
            
                      Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: ElevatedButton(
                              onPressed: () {
                                launchUrlString(
                                  "https://github.com/DaodaihaiCrays",
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 30),
                                backgroundColor: Colors.black,
                                foregroundColor: CustomColor.whitePrimary,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/github.svg', // hoặc dùng Icons nếu có sẵn
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Github",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              launchUrlString(
                                "https://www.linkedin.com/in/daodaihai/",
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 30),
                              backgroundColor: Colors.black,
                              foregroundColor: CustomColor.whitePrimary,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                    'assets/linkedin2.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "LinkedIn",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () async {
                          // Handle tap
            
                          String? encodeQueryParameters(
                            Map<String, String> params,
                          ) {
                            return params.entries
                                .map(
                                  (MapEntry<String, String> e) =>
                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
                                )
                                .join('&');
                          }
            
                          final Uri emailUri = Uri(
                            scheme: 'mailto',
                            path: "daodaihai.work@gmail.com",
                            query: encodeQueryParameters(<String, String>{
                              'subject': 'Example Subject & Symbols are allowed!',
                            }),
                          );
                          await launchUrl(emailUri);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(410, 30),
                          backgroundColor: Colors.black,
                          foregroundColor: CustomColor.whitePrimary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: SvgPicture.asset(
                                'assets/email.svg', // hoặc dùng Icons nếu có sẵn
                                width: 20,
                                height: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // Footer
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 2),
                  child: Center(
                    child: Text(
                      "For more details about my projects, please click on the project names to visit their GitHub repositories.",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
