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

              // Most Used Languages & Tools
              Container(
                padding: const EdgeInsets.all(PaddingConst.defaultPadding),
                color: ColorConst.secondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: PaddingConst.defaultPadding),
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

              // Time Travel
              Container(
                padding: const EdgeInsets.all(PaddingConst.defaultPadding),
                color: ColorConst.secondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(
                      "Time Travel",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Spacer(flex: 2),
                    // Timeline
                    AspectRatio(
                      aspectRatio: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Timeline.tileBuilder(
                          theme: TimelineThemeData(
                            color: ColorConst.primaryColor,
                            direction: Axis.horizontal,
                            connectorTheme: const ConnectorThemeData(
                              space: 30.0,
                              thickness: 5.0,
                            ),
                          ),
                          builder: TimelineTileBuilder.connected(
                            itemCount: myTimeLine.length,
                            connectionDirection: ConnectionDirection.before,

                            // Content Text
                            contentsBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text(
                                  myTimeLine[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },

                            // This will make expended
                            itemExtentBuilder: (_, __) {
                              return MediaQuery.of(context).size.width / 4;
                              // _processes.length;
                            },

                            // This use to creating Dot.
                            indicatorBuilder: (context, index) {
                              return const OutlinedDotIndicator(
                                borderWidth: 4.0,
                                color: ColorConst.primaryColor,
                              );
                            },

                            // This use to creating Line.
                            connectorBuilder: (_, index, type) {
                              return const SolidLineConnector(
                                color: ColorConst.primaryColor,
                              );
                            },
                          ),
                        ),
                      ),
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
