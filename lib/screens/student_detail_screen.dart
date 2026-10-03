import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentDetailScreen extends StatelessWidget {
  const StudentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is! Student) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Chi tiết sinh viên'),
        ),
        body: const Center(
          child: Text('Không có dữ liệu sinh viên hợp lệ'),
        ),
      );
    }

    final student = args;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sinh viên'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mã: ${student.id}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text('Họ tên: ${student.name}'),
            const SizedBox(height: 12),
            Text('Tuổi: ${student.age}'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Quay lại danh sách'),
            ),
          ],
        ),
      ),
    );
  }
}