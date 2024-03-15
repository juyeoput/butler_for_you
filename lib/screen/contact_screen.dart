import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  final String letter;
  const Contact({super.key, required this.letter});

  @override
  ContactState createState() => ContactState();
}

class ContactState extends State<Contact> {
  final TextEditingController _searchController = TextEditingController();
  List<String> itemsName = [
    '김종국',
    '송지효',
    '하하',
    '유재석',
    '지석진',
    '양세찬',
  ];
  List<String> itemsPhone = [
    '010-0000-0000',
    '010-1111-1111',
    '010-2222-2222',
    '010-3333-3333',
    '010-4444-4444',
    '010-5555-5555',
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = itemsName;
  }

  void _filterItems(String searchTerm) {
    setState(() {
      filteredItems = itemsName
          .where(
              (item) => item.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.letter,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: '집사의 이름을 입력하세요',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        filteredItems = itemsName;
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                  _filterItems(value);
                },
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            filteredItems[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(itemsPhone[index]),
                        ],
                      ),
                      subtitle: const Divider(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      children: [
                        const Expanded(
                            child: Center(child: Text('카카오톡으로 연락하기'))),
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(35.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            width: 100,
                            height: 50,
                            child: Image.asset(
                              'assets/kakao_login_medium_narrow.png',
                              width: 100,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      children: [
                        const Expanded(child: Center(child: Text('메신저로 연락하기'))),
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(35.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            width: 100,
                            height: 48,
                            child: Image.asset(
                              'assets/991159465C3D7D110F.png',
                              width: 140,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      children: [
                        const Expanded(child: Center(child: Text('전화하기'))),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35.0),
                            child: Container(
                                width: 100,
                                height: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/735d6d9a98c0acf64a291dc1fc442aa9.jpg',
                                  width: 100,
                                  height: 50,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//--------------
