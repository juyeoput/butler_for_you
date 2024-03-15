import 'package:flutter/material.dart'; // !! 서버에서 사진을 불러오는 코드 추가하기 !!

class Construction extends StatefulWidget {
  const Construction({super.key});

  @override
  ConstructionState createState() => ConstructionState();
}

class ConstructionState extends State<Construction> {
  List<String> locations = [
    '서울',
    '경기',
    '인천',
    '제주',
    '강원',
    '전라',
    '경상',
    '충청',
    '부산',
  ];
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredLocations = locations
        .where((location) =>
            location.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      appBar: AppBar(
        title: const Text(
          '시공사진',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '집사님들이 다녀온 고객님들의 집',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: listviewBuilder(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: '사진 검색',
                      hintText: '지역 이름으로 검색해보세요! 예(경남)',
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    //그리드 생성
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 각 항목의 최대 크기 지정
                      childAspectRatio: 3.0,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: filteredLocations.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 210, 207, 207)),
                          ),
                          child: Center(
                            child: Text(
                              filteredLocations[index],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listviewBuilder() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          Container(
            width: 300,
            height: 300,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: const Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/shutterstock_2202068961.jpg',
                ),
              ),
            ),
          ),
          const Text('서울특별시 00구',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      );
    },
  );
}
