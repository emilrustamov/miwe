import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hackaton/core/assets.dart';
import 'package:hackaton/core/colors.dart';

class AgronomScreen extends StatefulWidget {
  const AgronomScreen({super.key});

  @override
  State<AgronomScreen> createState() => _AgronomScreenState();
}

final List<String> items = ['Участок 1', 'Участок 2', 'Участок 3', 'Участок 4'];
String? selectedItem = "Участок 1";
TextEditingController _controller = TextEditingController();

class _AgronomScreenState extends State<AgronomScreen> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default date is today
      firstDate: DateTime(2000), // Minimum selectable date
      lastDate: DateTime(2101), // Maximum selectable date
    );

    if (selectedDate != null) {
      // Update the text field with the selected date in the format you prefer
      setState(() {
        _controller.text =
            "${selectedDate.toLocal()}".split(' ')[0]; // Format as yyyy-MM-dd
      });
    }
  }

  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      CoreAssets.icon,
                      width: 70,
                    ),
                    Text(
                      "Новая задача",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ]),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedItem,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  // width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: CoreColors.lightGrey,
                    ),
                    color: CoreColors.lightGrey,
                  ),
                  // elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  iconEnabledColor: CoreColors.black,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  useSafeArea: true,
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: CoreColors.lightGrey,
                  ),
                  offset: const Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 10),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CoreColors.lightGrey,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 19,
                      ),
                    ),
                  ),
                  for (int i = 1; i < 10; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 12, bottom: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CoreColors.green,
                        ),
                        child: Text("A$i"),
                      ),
                    ),
                ],
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "Date",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  suffixIcon: const Icon(Icons.calendar_month_outlined)),
              // controller: _loginController,
              onTap: () {
                _selectDate(context);
              },
            ),
            Checkbox(
              value: _isChecked,
              onChanged: _toggleCheckbox,
            ),
          ],
        ),
      ),
    );
  }
}
