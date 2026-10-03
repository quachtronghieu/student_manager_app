import 'package:flutter/material.dart';
import '../models/student.dart';



class StudentTile extends StatelessWidget {
  final Student student;
  final VoidCallback? onTap;
  const StudentTile({super.key, required this.student, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(student.name),
      subtitle: Text(
        'Mã: ${student.id} - Tuổi: ${student.age}',
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}