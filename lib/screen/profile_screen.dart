import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/GCR_logo.jpeg'),
          ),
          const SizedBox(height: 20),
          const Text(
            '이삭',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Isaac0082@example.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement profile editing logic
            },
            child: const Text('수정'),
          ),
        ],
      ),
    );
  }
}
