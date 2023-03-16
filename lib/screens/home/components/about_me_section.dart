import 'package:flutter/material.dart';
import 'package:kisahcode/util/responsive.dart';

import '../../../components/animated_progress_indicator.dart';
import '../../../util/const.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: PaddingConst.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: PaddingConst.defaultPadding),
          const Responsive(
            mobile: AboutMeGridView(
              crossAxisCount: 1,
              childAspectRatio: 1.1,
            ),
            mobileLarge: AboutMeGridView(
              crossAxisCount: 1,
            ),
            tablet: AboutMeGridView(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
            ),
            tabletLarge: AboutMeGridView(childAspectRatio: 1),
            desktop: AboutMeGridView(),
          ),
        ],
      ),
    );
  }
}

class AboutMeGridView extends StatelessWidget {
  const AboutMeGridView({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.5,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: PaddingConst.defaultPadding,
        mainAxisSpacing: PaddingConst.defaultPadding,
      ),
      children: [
        // Profile
        Container(
          padding: const EdgeInsets.all(PaddingConst.defaultPadding),
          color: ColorConst.secondaryColor,
          child: Column(
            children: [
              const Spacer(flex: 2),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/kisah3.jpg"),
              ),
              const Spacer(),
              Text(
                "Kisah Tegar Putra Abdi",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Text(
                "Flutter Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              const Text(
                "I learned programming since I was in high school. The first language I learned was python, creating desktop applications and other programs.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),

        // Most Used Languages & Tools
        Container(
          padding: const EdgeInsets.all(PaddingConst.defaultPadding),
          color: ColorConst.secondaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: PaddingConst.defaultPadding),
                child: Text(
                  "Most Used Languages & Tools",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const Spacer(flex: 2),
              Row(
                children: const [
                  Expanded(
                    child: AnimatedCircularProgressIndicator(
                      percentage: 0.75,
                      label: "Dart",
                    ),
                  ),
                  SizedBox(width: PaddingConst.defaultPadding),
                  Expanded(
                    child: AnimatedCircularProgressIndicator(
                      percentage: 0.70,
                      label: "Firebase",
                    ),
                  ),
                  SizedBox(width: PaddingConst.defaultPadding),
                  Expanded(
                    child: AnimatedCircularProgressIndicator(
                      percentage: 0.42,
                      label: "Python",
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),

        // My Repository
        Container(
          padding: const EdgeInsets.all(PaddingConst.defaultPadding),
          color: ColorConst.secondaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text(
                "My Repository",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: PaddingConst.defaultPadding),

              // List of my Repository
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset("assets/icons/flutter-icon.png"),
                        title: const Text('Flutter'),
                        onTap: () {
                          openUrl("https://github.com/kisahtegar/Flutter");
                        },
                      ),
                      ListTile(
                        leading: Image.asset("assets/icons/python-icon.png"),
                        title: const Text('Python'),
                        onTap: () {
                          openUrl("https://github.com/kisahtegar/Python");
                        },
                      ),
                      ListTile(
                        leading: Image.asset("assets/icons/cpp-icon.png"),
                        title: const Text('C++'),
                        onTap: () {
                          openUrl("https://github.com/kisahtegar/cpp");
                        },
                      ),
                      ListTile(
                        leading: Image.asset("assets/icons/html-icon.png"),
                        title: const Text('HTML'),
                        onTap: () {
                          openUrl("https://github.com/kisahtegar/html");
                        },
                      ),
                      ListTile(
                        leading: Image.asset("assets/icons/ahk-icon.png"),
                        title: const Text('Auto Hot Key'),
                        onTap: () {
                          openUrl("https://github.com/kisahtegar/ahk");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: PaddingConst.defaultPadding),
            ],
          ),
        ),
      ],
    );
  }
}
