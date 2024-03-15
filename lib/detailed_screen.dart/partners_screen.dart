import 'package:flutter/material.dart'; // !! 서버에서 협력업체의 리스트를 불러와야 함!!

class Partners extends StatelessWidget {
  Partners({super.key});
  final List<String> listOfPartners = ['협력업체 A', '협력업체 B', '협력업체 C', '협력업체 D'];
  final List<String> imageFiles = [
    'assets/GCR_logo_full.jpeg',
    'assets/KakaoTalk_Photo_2024-01-08-13-50-15.jpeg',
    'assets/GCR_logo_full.jpeg',
    'assets/KakaoTalk_Photo_2024-01-08-13-50-15.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('협력업체',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                for (int name = 0; name < imageFiles.length; name++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listOfPartners[name],
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 500,
                        height: 200,
                        child: Image.asset(imageFiles[name]),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
              ],
            ),
          ),
        ));
  }
}
