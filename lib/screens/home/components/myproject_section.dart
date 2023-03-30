import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../data/models/myproject_model.dart';
import '../../../util/const.dart';

class MyProjectSection extends StatefulWidget {
  const MyProjectSection({
    super.key,
  });

  @override
  State<MyProjectSection> createState() => _MyProjectSectionState();
}

class _MyProjectSectionState extends State<MyProjectSection> {
  late Future<List<MyProjectModel>> futureMyProject;

  @override
  void initState() {
    super.initState();
    futureMyProject = fetchMyProjects();
  }

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
            child: FutureBuilder<List<MyProjectModel>>(
              future: futureMyProject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(
                            right: PaddingConst.defaultPadding),
                        child: _ProjectCard(
                          myProjectModel: snapshot.data![index],
                        ),
                      ),
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

/// This function will fetching/get MyProjects then return json decode as `List`
// TODO: Need to change use method from datasources with injection?
Future<List<MyProjectModel>> fetchMyProjects() async {
  try {
    final response = await get(Uri.parse(
        "https://kisahcode-default-rtdb.asia-southeast1.firebasedatabase.app/myprojects.json"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => MyProjectModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  } catch (e) {
    debugPrint("fetchMyProjects: $e");
    return [];
  }
}
