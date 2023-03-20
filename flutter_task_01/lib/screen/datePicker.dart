import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  int? currentyear;
  int? fetchyear;
  int? currentmonth;
  int? fetchday;
  int? fetchmonth;
  int ageYear = 0;
  int ageMonth = 0;
  int ageday = 0;
  int? currentday;
  int ages = 0;

  String? dates;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 64, 56),
        title: const Text('Date Picker Exmple'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                icon: Icon(Icons.date_range),
                style: ElevatedButton.styleFrom(primary: Colors.brown),
                onPressed: () {
                  DatePickerMethod();
                },
                label: Text('Select Date')),
            Text(
              "$ages",
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 5, 56, 104)),
            ),
          ],
        ),
      ),
    );
  }

  void DatePickerMethod() {
    showDatePicker(
            context: context,
            cancelText: 'No',
            confirmText: 'Ok',
            initialDate: _selectedDate ?? DateTime.now(),
            firstDate: DateTime(2001),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return 0;
      } else {
        setState(() {
          _selectedDate = value;

          currentyear = DateTime.now().year;
          fetchyear = int.parse(DateFormat('yyyy').format(_selectedDate!));
          // ageYear = (currentyear! - fetchyear!);
          fetchmonth = int.parse(DateFormat('MM').format(_selectedDate!));
          fetchday = int.parse(DateFormat('dd').format(_selectedDate!));

          currentmonth = DateTime.now().month;
          currentday = DateTime.now().day;
          ages = currentyear! - fetchyear!;
          print(_selectedDate);
          if (currentmonth! < fetchmonth!) {
            ages--;
          } else if (currentmonth == fetchmonth) {
            if (fetchday! > currentday!) {
              ages--;
            }
          }
          print("....>year>>.$currentday");
          print("...>month>>.$fetchday");
          print("..>day >$ageday");
        });
      }
    });
  }
}
