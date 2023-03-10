import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

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
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
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

              // Most Used Languages
              Container(
                padding: const EdgeInsets.all(PaddingConst.defaultPadding),
                color: ColorConst.secondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 2),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: PaddingConst.defaultPadding),
                      child: Text(
                        "Most Used Languages",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
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
                            percentage: 0.15,
                            label: "Python",
                          ),
                        ),
                        SizedBox(width: PaddingConst.defaultPadding),
                        Expanded(
                          child: AnimatedCircularProgressIndicator(
                            percentage: 0.1,
                            label: "HTML",
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
