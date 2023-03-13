import 'package:flutter/material.dart';

import '../../../models/myproject_model.dart';
import '../../../util/const.dart';

class MyProjectSection extends StatelessWidget {
  const MyProjectSection({
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
          // Title Section
          Text(
            "My Projects",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: PaddingConst.defaultPadding),

          // Card view project Section
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                myProjects.length,
                (index) => Padding(
                  padding:
                      const EdgeInsets.only(right: PaddingConst.defaultPadding),
                  child: _ProjectCard(
                    myProjectModel: myProjects[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.myProjectModel});

  final MyProjectModel myProjectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 310,
      color: ColorConst.secondaryColor,
      padding: const EdgeInsets.all(PaddingConst.defaultPadding),
      child: Column(
        children: [
          Text(
            myProjectModel.name!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: PaddingConst.defaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: ColorConst.bgColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 9),
                    blurRadius: 20,
                    color: ColorConst.shadowColor.withOpacity(0.3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.network(myProjectModel.imageUrl.toString()),
              ),
            ),
          ),
          const SizedBox(height: PaddingConst.defaultPadding),
          Text(
            myProjectModel.description!,
            maxLines: 4,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              height: 1.5,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              openUrl(myProjectModel.link!);
            },
            child: const Text(
              "</Explore More>",
              style: TextStyle(color: ColorConst.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
