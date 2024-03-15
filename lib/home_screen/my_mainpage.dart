import 'package:butler_for_you/detailed_screen.dart/announcement_screen.dart';
import 'package:butler_for_you/detailed_screen.dart/construction_photo_screen.dart';
import 'package:butler_for_you/screen/membership_screen.dart';
import 'package:butler_for_you/detailed_screen.dart/partners_screen.dart';
import 'package:butler_for_you/detailed_screen.dart/register.scree.dart';
import 'package:butler_for_you/home_screen/home_screen.dart';
import 'package:butler_for_you/detailed_screen.dart/log_in_screen.dart';
import 'package:butler_for_you/screen/profile_screen.dart';
import 'package:butler_for_you/screen/search_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool _showButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          //stack 사용해서 Row 위에 설정 아이콘 올려두기
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 50,
            ),
            const Text(
              '나의 집사 호출 서비스',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // 설정 아이콘 클릭 시 버튼 목록 토글
                setState(() {
                  _showButtons = !_showButtons;
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  _getBody(_currentIndex),
                  Align(
                    alignment: Alignment.topRight,
                    child: _showButtons
                        ? _buildButtonsContainer()
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _showButtons = false;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '나의 집사',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 정보',
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsContainer() {
    return SizedBox(
      // 배경색
      width: 120,
      child: ListView(
        shrinkWrap: true,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              shadowColor: const Color.fromARGB(255, 44, 41, 41),
              elevation: 10,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Construction(),
                ),
              );
              setState(() {
                _showButtons = false;
              });
            },
            child: const Text(
              '시공사진',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              shadowColor: const Color.fromARGB(255, 44, 41, 41),
              elevation: 10,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Membership(),
                ),
              );
              setState(() {
                _showButtons = false;
              });
            },
            child: const Text('회원권/결제',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              shadowColor: const Color.fromARGB(255, 44, 41, 41),
              elevation: 10,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Partners(),
                ),
              );
              setState(() {
                _showButtons = false;
              });
            },
            child: const Text('협력업체',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              shadowColor: const Color.fromARGB(255, 44, 41, 41),
              elevation: 10,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NoticePage(),
                ),
              );
              setState(() {
                _showButtons = false;
              });
            },
            child: const Text('공지사항',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              shadowColor: const Color.fromARGB(255, 44, 41, 41),
              elevation: 10,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ),
              );
              setState(() {
                _showButtons = false;
              });
            },
            child: const Text('회원가입',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              shadowColor: const Color.fromARGB(255, 44, 41, 41),
              elevation: 10,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
              setState(() {
                _showButtons = false;
              });
            },
            child: const Text('로그인',
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const ProfileScreen();
      default:
        return Container(); // 예외 처리
    }
  }
}
