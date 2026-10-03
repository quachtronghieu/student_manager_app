import 'package:flutter/material.dart';

import '../models/student.dart';
import '../routes/app_routes.dart';
import '../widgests/student_title.dart';
import 'student_form_screen.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() {
    return _StudentListScreenState();
  }
}

class _StudentListScreenState extends State<StudentListScreen> {
  final List<Student> _students = [
    const Student(id: 'S001', name: 'Nguyễn Văn A', age: 20),
    const Student(id: 'S002', name: 'Trần Thị B', age: 21),
    const Student(id: 'S003', name: 'Lê Văn C', age: 19),
  ];
  void _goToDetail(Student student) {
    Navigator.pushNamed(context, AppRoutes.studentDetail, arguments: student);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách sinh viên')),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          final student = _students[index];

          return StudentTile(
            student: student,
            onTap: () {
              _goToDetail(student);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _goToForm() async {
    final student = await Navigator.push<Student>(
      context,
      MaterialPageRoute<Student>(
        builder: (context) => const StudentFormScreen(),
      ),
    );

    if (!mounted) {
      return;
    }

    if (student != null) {
      setState(() {
        _students.add(student);
      });
    }
  }
}
