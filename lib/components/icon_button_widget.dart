import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class IconButtonWidget extends StatelessWidget {
  final String? link;
  final IconData? icon;

  const IconButtonWidget({
    Key? key,
    this.link,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final Uri url = Uri.parse("$link");
        if (!await launchUrl(url)) {
          throw 'Could not launch $url';
        }
      },
      icon: FaIcon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
