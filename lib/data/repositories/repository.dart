// import 'package:kisahcode/data/datasources/network_remote_data_source.dart';
// import 'package:kisahcode/data/models/timeline_model.dart';

// class Repository {
//   final NetworkRemoteDataSource? networkRemoteDataSource;

//   Repository({this.networkRemoteDataSource});

//   /// Fetching data timeline from API `Repository()`.
//   Future<List<TimelineModel>> fetchTimelines() async {
//     final timelinesRaw = await networkRemoteDataSource!.fetchTimelines();
//     return timelinesRaw.map((e) => TimelineModel.fromJson(e)).toList();
//   }
// }
