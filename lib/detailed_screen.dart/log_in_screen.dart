import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('나 집사요 통합 로그인',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              const SizedBox(
                width: 300,
                height: 200,
                child: Image(
                  image: AssetImage(
                      'assets/KakaoTalk_Photo_2024-01-08-13-50-15.jpeg'),
                ),
              ),
              TextField(
                controller: _idController,
                decoration: const InputDecoration(labelText: '아이디'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: '비밀번호'),
                obscureText: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _login(context);
                },
                child: const Text('로그인'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(context) {
    String id = _idController.text;
    String password = _passwordController.text;

    if (_isValidCredentials(id, password)) {
      _showSuccess('로그인에 성공했습니다!');
      Navigator.pop(context);
    } else {
      _showError('아이디 또는 비밀번호를 다시 확인해주세요');
    }
  }

  bool _isValidCredentials(String id, String password) {
    // 서버 호출을 모방한 로직 (실제로는 서버에 연결되어야 함)
    // 예제로서 간단하게 아이디와 비밀번호가 일치하는지만 체크함
    return id.length >= 9 &&
        id.length <= 16 &&
        password.length >= 9 &&
        password.length <= 16;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
