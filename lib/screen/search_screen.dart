import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> items = [
    '김종국',
    '송지효',
    '하하',
    '유재석',
    '지석진',
    '양세찬',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void _filterItems(String searchTerm) {
    setState(() {
      filteredItems = items
          .where(
              (item) => item.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      filteredItems = items;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                _filterItems(value);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                return; // 나중에 동작 설정
              },
              child: const Text('검색'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredItems[index],
                        style: const TextStyle(fontSize: 18)),
                    subtitle: const Divider(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
