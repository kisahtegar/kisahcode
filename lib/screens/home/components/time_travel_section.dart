import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../../data/datasources/network_remote_data_source.dart';
import '../../../data/models/timeline_model.dart';
import '../../../util/const.dart';
import '../../../util/responsive.dart';

class TimeTravelSection extends StatefulWidget {
  const TimeTravelSection({
    super.key,
  });

  @override
  State<TimeTravelSection> createState() => _TimeTravelSectionState();
}

class _TimeTravelSectionState extends State<TimeTravelSection> {
  final int _processIndex = 1;
  late Future<List<TimelineModel>> futureTimeline;

  @override
  void initState() {
    super.initState();
    futureTimeline = NetworkRemoteDataSource.fetchTimelines();
  }

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
            child: FutureBuilder<List<TimelineModel>>(
              future: futureTimeline,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Timeline.tileBuilder(
                    theme: TimelineThemeData(
                      direction: Axis.horizontal,
                      connectorTheme: const ConnectorThemeData(
                        space: 30.0,
                        thickness: 5.0,
                      ),
                    ),
                    builder: TimelineTileBuilder.connected(
                      itemCount: snapshot.data!.length,
                      connectionDirection: ConnectionDirection.before,

                      oppositeContentsBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              snapshot.data![index].dateTime != ""
                                  ? Icon(
                                      Icons.calendar_month,
                                      color: _getColor(index),
                                    )
                                  : const SizedBox(),
                              Text(
                                snapshot.data![index].dateTime,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _getColor(index),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      // Content Text
                      contentsBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            snapshot.data![index].description,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _getColor(index),
                            ),
                          ),
                        );
                      },

                      // This will make expended
                      itemExtentBuilder: (_, __) {
                        if (Responsive.isMobile(context)) {
                          return MediaQuery.of(context).size.width / 1.2;
                        }
                        if (Responsive.isMobileLarge(context)) {
                          return MediaQuery.of(context).size.width / 1.2;
                        }
                        if (Responsive.isTablet(context)) {
                          return MediaQuery.of(context).size.width / 2;
                        }
                        if (Responsive.isTabletLarge(context)) {
                          return MediaQuery.of(context).size.width / 2;
                        }
                        return MediaQuery.of(context).size.width / 4;
                        // _processes.length;
                      },

                      // This use to creating Dot.
                      indicatorBuilder: (context, index) {
                        Color color;
                        Widget? child;

                        // Validate if index == process index
                        if (index == _processIndex) {
                          color = ColorConst.inProgressColor;
                          child = const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                              valueColor: AlwaysStoppedAnimation(Colors.green),
                            ),
                          );
                        } else if (index < _processIndex) {
                          color = ColorConst.completeColor;
                          child = const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15.0,
                          );
                        } else {
                          color = ColorConst.todoColor;
                        }

                        // Validate if index <= process index
                        if (index <= _processIndex) {
                          return Stack(
                            children: [
                              CustomPaint(
                                size: const Size(30.0, 30.0),
                                painter: _BezierPainter(
                                  color: color,
                                  drawStart: index > 0,
                                  drawEnd: index < _processIndex,
                                ),
                              ),
                              DotIndicator(
                                size: 30.0,
                                color: color,
                                child: child,
                              ),
                            ],
                          );
                        } else {
                          return Stack(
                            children: [
                              CustomPaint(
                                size: const Size(15.0, 15.0),
                                painter: _BezierPainter(
                                  color: color,
                                  drawEnd: index < myTimeLine.length - 1,
                                ),
                              ),
                              OutlinedDotIndicator(
                                borderWidth: 4.0,
                                color: color,
                              ),
                            ],
                          );
                        }
                      },

                      // This use to creating Line.
                      connectorBuilder: (_, index, type) {
                        if (index > 0) {
                          if (index == _processIndex) {
                            final prevColor = _getColor(index - 1);
                            final color = _getColor(index);
                            List<Color> gradientColors;

                            if (type == ConnectorType.start) {
                              gradientColors = [
                                Color.lerp(prevColor, color, 0.5)!,
                                color
                              ];
                            } else {
                              gradientColors = [
                                prevColor,
                                Color.lerp(prevColor, color, 0.5)!
                              ];
                            }
                            return DecoratedLineConnector(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors,
                                ),
                              ),
                            );
                          } else {
                            return SolidLineConnector(
                              color: _getColor(index),
                            );
                          }
                        } else {
                          return null;
                        }
                      },
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Getting color
  Color _getColor(int index) {
    if (index == _processIndex) {
      return ColorConst.inProgressColor;
    } else if (index < _processIndex) {
      return ColorConst.completeColor;
    } else {
      return ColorConst.todoColor;
    }
  }
}

class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    double angle;
    Offset offset1;
    Offset offset2;

    Path path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}
