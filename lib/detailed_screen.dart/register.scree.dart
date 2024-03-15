import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  String? _gender;
  late String password;
  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '통합 회원가입',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
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
              TextFormField(
                controller: username,
                decoration: const InputDecoration(labelText: '아이디 (필수))'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '비밀번호 (필수)'),
                obscureText: true,
                controller: _passwordController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '비밀번호 확인 (필수))'),
                obscureText: true,
                controller: _confirmPasswordController,
              ),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: '이름 (필수)'),
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: '이메일 주소 (필수)'),
                keyboardType: TextInputType.emailAddress,
              ),
              Row(
                children: [
                  const Text('성별 (필수)'),
                  Radio<String>(
                    value: '남',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  const Text('남자'),
                  Radio<String>(
                    value: '여',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  const Text('여자'),
                ],
              ),
              TextFormField(
                controller: address,
                decoration: const InputDecoration(labelText: '주소 (필수)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    password = _passwordController.text;
                    confirmPassword = _confirmPasswordController.text;
                    _validateAndRegister();
                  });
                },
                child: const Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndRegister() {
    if (username.text.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        name.text.isEmpty ||
        email.text.isEmpty ||
        address.text.isEmpty ||
        _gender == null) {
      // 모든 필드를 기입하도록 메시지 표시
      _showErrorDialog('모든 필드를 정확하게 입력해주세요!');
    } else if (password.length < 9 || password.length > 16) {
      // 비밀번호 길이 제한 메시지 표시
      _showErrorDialog('비밀번호는 9-16자리여야 합니다.');
    } else if (password != confirmPassword) {
      // 비밀번호 일치 여부 확인 메시지 표시
      _showErrorDialog('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
    } else {}
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('오류'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
