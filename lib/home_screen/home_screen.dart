import 'package:butler_for_you/screen/contact_screen.dart';
import 'package:butler_for_you/screen/finding_butler_screen.dart';
import 'package:butler_for_you/detailed_screen.dart/introduction_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildClickableItem(
          context,
          '나 집사요 서비스 소개',
          'assets/shutterstock_2326615941.jpg',
          'AI 기반 혁신 플랫폼',
          '최적화된 인공지능 모델을 기반으로한 \n찾아가는 서비스를 이용해보세요!',
          const Color.fromARGB(255, 255, 212, 209),
          const Color.fromARGB(255, 255, 65, 52),
          '찾아가는 AI모델',
          0,
        ),
        _buildClickableItem(
          context,
          '내 주변 집사 찾기',
          'assets/shutterstock_2103522344.jpg',
          '더 빨라진 매칭속도',
          '업체를 검색해서 찾는 시간은 줄여요. \n이제는 나 집사요가 알아서 매칭해드릴게요!',
          const Color.fromARGB(255, 255, 248, 186),
          const Color.fromARGB(255, 255, 143, 38),
          '실시간 매칭',
          1,
        ),
        _buildClickableItem(
          context,
          '집사에게 연락하기',
          'assets/shutterstock_2259921419.jpg',
          '바로 연락해요',
          '전화나 메신저, 카카오톡을 이용해 \n주변의 집사에게 바로 전화해보세요!',
          const Color.fromARGB(
            255,
            180,
            229,
            255,
          ),
          const Color.fromARGB(255, 18, 93, 255),
          '내 전문 집사님',
          2,
        ),
      ],
    );
  }

  Widget _buildClickableItem(
    BuildContext context,
    String titleText,
    String imagePath,
    String titleOnce,
    String description,
    Color containerColor,
    Color textColor,
    String highlight,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        // 각 컨테이너들을 클릭했을 때 다른 페이지로 이동하도록 설정
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Introduction(letter: titleText),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FindingButler(letter: titleText),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Contact(letter: titleText),
              ),
            );
            break;
        }
      },
      child: Column(
        //홈페이지 body의 3개의 child(container들 집합)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            height: 150,
            margin: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              color: containerColor,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, // 그림자 색상 설정
                    spreadRadius: 3, // 그림자 확산 범위
                    blurRadius: 10, // 그림자 흐림 정도
                    offset: Offset(0, 10)),
              ],
            ), // 그림자 위치 (가로, 세로)]
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titleOnce,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      child: Text(description,
                          style: const TextStyle(fontSize: 13)),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white, // radius 값 설정
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        highlight,
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: textColor,
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: Image.asset(
                      imagePath,
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
