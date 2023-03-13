import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../../util/const.dart';

class TimeTravelSection extends StatelessWidget {
  const TimeTravelSection({
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
            "Time Travel",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: PaddingConst.defaultPadding),
          Container(
            color: ColorConst.secondaryColor,
            height: 300,
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
        ],
      ),
    );
  }
}
