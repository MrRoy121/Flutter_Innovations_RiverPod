import 'package:flutter/material.dart';
import '../controller/isar_controller.dart';
import '../model/course.dart';

class CourseScreen extends StatefulWidget {
  final IsarController service;
  const CourseScreen(this.service, {Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Give your new Course a name",
                style: Theme.of(context).textTheme.headlineSmall),
            TextFormField(
              controller: _textController,
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Course Name is not allowed to be empty";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    widget.service.saveCourse(Course()..title = _textController.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "New course '${_textController.text}' saved in DB")));

                    Navigator.pop(context);
                  }
                },
                child: const Text("Add new Course"))
          ],
        ),
      ),
    );
  }
}
