import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../components/icon_button_widget.dart';
import '../../../util/const.dart';
import '../../../util/responsive.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // aspectRatio: Responsive.isMobile(context) ? 1.5 : 3.5,
      aspectRatio: Responsive.isMobile(context)
          ? 1.5
          : Responsive.isMobileLarge(context)
              ? 2
              : 3.5,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image background Banner
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
          ),

          // This will make Image more dark
          Container(color: ColorConst.darkColor.withOpacity(0.50)),

          // [Column] : Contains title, animated text, link social media.
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingConst.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Explore my experience in the \nProgramming world!",
                  style: (Responsive.isDesktop(context) ||
                          Responsive.isTabletLargeG(context))
                      ? Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorConst.bodyTitleTextColor,
                          )
                      : Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorConst.bodyTitleTextColor,
                          ),
                ),
                if (Responsive.isMobileLarge(context))
                  const SizedBox(height: PaddingConst.defaultPadding),

                // Animated text
                const MyBuildAnimatedText(),
                SizeConst.sizeVer(PaddingConst.defaultPadding),

                // Social Media link.
                Row(
                  children: const [
                    IconButtonWidget(
                      link: "https://www.instagram.com/kisahtegar_code/",
                      icon: FontAwesomeIcons.instagram,
                    ),
                    IconButtonWidget(
                      link:
                          "https://www.linkedin.com/in/kisah-tegar-putra-abdi-10510924b/",
                      icon: FontAwesomeIcons.linkedin,
                    ),
                    IconButtonWidget(
                      link: "https://github.com/kisahtegar",
                      icon: FontAwesomeIcons.github,
                    ),
                    IconButtonWidget(
                      link: "https://twitter.com/TegarKisah",
                      icon: FontAwesomeIcons.twitter,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// This widget SubTitle banner
class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.titleMedium!,
      maxLines: 1,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context)) const DevCodedText(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: PaddingConst.defaultPadding / 2),
          const Text("I build "),
          // const AnimatedText(),
          Responsive.isMobile(context)
              ? const Expanded(child: AnimatedText())
              : const AnimatedText(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: PaddingConst.defaultPadding / 2),
          if (!Responsive.isMobileLarge(context)) const DevCodedText(),
        ],
      ),
    );
  }
}

/// This widget contains `AnimatedTextKit` and List of text
class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TyperAnimatedText(
          "responsive web and mobile app.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "game with Unity.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "Chat app.",
          speed: const Duration(milliseconds: 60),
        ),
      ],
    );
  }
}

/// This widget output string `<Dev>`
class DevCodedText extends StatelessWidget {
  const DevCodedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
              text: "Dev", style: TextStyle(color: ColorConst.primaryColor)),
          TextSpan(text: ">")
        ],
      ),
    );
  }
}
