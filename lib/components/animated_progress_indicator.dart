import 'package:flutter/material.dart';

import '../util/const.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Circullar Indicator
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: defaultDuration,
            builder: (context, double value, child) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: value,
                    color: ColorConst.primaryColor,
                    backgroundColor: ColorConst.darkColor,
                  ),
                  Center(
                    child: Text(
                      "${(value * 100).toInt()}%",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 5),

        // Label
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
