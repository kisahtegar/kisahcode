import 'package:flutter/material.dart';

import '../../util/const.dart';
import 'components/about_me_section.dart';
import 'components/home_banner_section.dart';
import 'components/myproject_section.dart';
import 'components/time_travel_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingConst.defaultPadding,
          ),
          child: Column(
            children: const [
              HomeBannerSection(),
              AboutMeSection(),
              MyProjectSection(),
              TimeTravelSection(),
            ],
          ),
        ),
      ),
    );
  }
}
