import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';

class FindingButler extends StatefulWidget {
  // 가장 주변에 있는 집사님을 호출하세요.
  final String letter;
  const FindingButler({super.key, required this.letter});

  @override
  State<FindingButler> createState() => _FindingButlerState();
}

class _FindingButlerState extends State<FindingButler> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime? _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return homeWidget();
  }

  void _handleDayClick(DateTime selectedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = selectedDay;
    });
  }

  Widget homeWidget() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      appBar: AppBar(
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              '날짜 선택을 해주세요',
              style: TextStyle(fontSize: 18),
            ),
            TableCalendar(
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2050),
              selectedDayPredicate: (date) {
                return isSameDay(_selectedDay, date);
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _handleDayClick(selectedDay);
                });
              },
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                CupertinoButton(
                  color: const Color.fromARGB(255, 206, 204, 204),
                  child: const Text(
                    '시간 설정을 해주세요(클릭)',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                  onPressed: () {
                    _showTimePicker();
                  },
                ),
                const SizedBox(height: 70),
                Text(
                  '희망시간: ${_selectedDay.month}월 ${_selectedDay.day}일 ${_selectedTime!.hour}시 ${_selectedTime!.minute}분',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(3),
                    minimumSize: MaterialStateProperty.all(const Size(100, 80)),
                  ),
                  onPressed: () {},
                  child: const Text('근처 집사 호출하기',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 148, 0, 174),
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _showTimePicker() async {
    DateTime? pickedTime = _selectedTime;

    // 쿠퍼티노 스타일의 시간 선택기 호출
    pickedTime = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop(pickedTime); // 터치 시 선택 완료
          },
          child: SizedBox(
            width: 300,
            height: 200,
            child: CupertinoPopupSurface(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: _selectedTime,
                onDateTimeChanged: (DateTime newTime) {
                  pickedTime = newTime;
                },
              ),
            ),
          ),
        );
      },
    );

    // 시간 선택 후 처리
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
}
