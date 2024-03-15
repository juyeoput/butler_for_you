import 'package:flutter/material.dart'; //!! 서버에서 공지사항을 불러오는 코드 추가하기 !!

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  NoticePageState createState() => NoticePageState();
}

class NoticePageState extends State<NoticePage> {
  List<String> notices = []; // 가상의 공지사항 목록

  @override
  void initState() {
    super.initState();
    // 가상의 데이터를 추가
    notices = List.generate(5, (index) => '나 집사요 공지사항 ${index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '나 집사요 공지사항',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notices[index]),
            // 공지사항을 클릭하면 상세 페이지로 이동할 수 있도록 설정
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NoticeDetailPage(notice: notices[index], index: index),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 새로운 공지사항 추가
          setState(() {
            notices.add('나 집사요 공지사항 ${notices.length + 1}');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoticeDetailPage extends StatelessWidget {
  final String notice;
  final int index;

  const NoticeDetailPage(
      {super.key, required this.notice, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '공지사항 ${index + 1}',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(notice),
      ),
    );
  }
}
