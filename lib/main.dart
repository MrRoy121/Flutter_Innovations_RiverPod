import 'package:flutter/material.dart';
import 'package:flutter_inovations/view/product_screen.dart';

import 'controller/sembast_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the Sembast database service
  final sembastService = SembastDatabaseService();

  runApp(MyApp(sembastService));
}

class MyApp extends StatelessWidget {
  final SembastDatabaseService service;

  const MyApp(this.service, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AccountScreen(service),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);
//   final service = IsarController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Isar DB Tutorial'), actions: [
//         IconButton(
//           onPressed: () => service.cleanDb(),
//           icon: const Icon(Icons.delete),
//         )
//       ]),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: StreamBuilder<List<Course>>(
//                 stream: service.listenToCourses(),
//                 builder: (context, snapshot) => GridView.count(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                   scrollDirection: Axis.horizontal,
//                   children: snapshot.hasData
//                       ? snapshot.data!.map((course) {
//                           return ElevatedButton(
//                             onPressed: () {
//                               CourseDetailPage.navigate(context, course, service);
//                             },
//                             child: Text(course.title),
//                           );
//                         }).toList()
//                       : [],
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return CourseScreen(service);
//                   });
//             },
//             child: const Text("Add Course"),
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () {
//               showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return StudentScreen(service);
//                   });
//             },
//             child: const Text("Add Student"),
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () {
//               showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return TeacherScreen(service);
//                   });
//             },
//             child: const Text("Add Teacher"),
//           ),
//           const SizedBox(height: 8),
//         ],
//       ),
//     );
//   }
// }
