import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  final String letter;
  const Introduction({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return homeWidget();
  }

  Widget homeWidget() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          letter,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 400,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, // 그림자 색상 설정
                        spreadRadius: 3, // 그림자 확산 범위
                        blurRadius: 10, // 그림자 흐림 정도
                        offset: Offset(0, 0)),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        'assets/KakaoTalk_Photo_2024-01-08-13-50-15.jpeg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '    우리집 관리하기 힘들다면? \n부모님 댁 관리해드리고 싶다면?',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  '"체계적인 주거 환경 관리를 통해 일상에 필요한 \n        서비스를 제공하는 생활 플랫폼입니다."',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(
                height: 40,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 170,
                    height: 180,
                    child: Image(
                      image: AssetImage('assets/shutterstock_1937900650.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 210.0, // 원하는 너비를 지정
                    height: 150.0,
                    child: Text(
                      '수리가 필요한 곳에 전문업체를 일일히 찾아보느라 고생하셨죠? 누구나 쉽고 간편하게 문의할 수 있는 나집사요를 이용해보세요. 주거환경이 개선됨에 따라 고객님의 삶의 만족도를 높여줍니다!',
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
              const SizedBox(
                  child: Image(
                image: AssetImage('assets/shutterstock_2126406329.jpg'),
              )),
              const Text(
                  '나 집사요는 이용자의 주거지를 관리해주는 플랫폼으로 회원권에 따라 간단한 수리나 말동무를 지원해 드리고 있습니다.'),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 270,
                    child: Text(
                      '저희는 인증된 업체와 협력하여 고객님의 신뢰를 우선시하며, 주거 환경 관리를 꼼꼼하게 제공하는데 중점을 두고 있습니다 ',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Image(
                    width: 100,
                    height: 100,
                    image: AssetImage('assets/shutterstock_1806852145.jpg'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
