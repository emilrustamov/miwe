import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hackaton/core/assets.dart';
import 'package:hackaton/core/colors.dart';
import 'package:hackaton/widgets/checkContainer.dart';
import 'package:hackaton/widgets/primaryBtn.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

final List<String> items = ['Участок 1', 'Участок 2', 'Участок 3', 'Участок 4'];
String? selectedItem = "Участок 1";
TextEditingController _controller = TextEditingController();
bool visible = false;
int? _selectedIndex;

// Список текстов для чекбоксов
final List<String> options = ["Полив", "Удобрение", "Сбор урожай", "Обработка"];

class _TaskCreateScreenState extends State<TaskCreateScreen> {
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

  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            // mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 1; i < 30; i++)
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CoreColors.lightGrey,
                  ),
                  child: Text("A$i"),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              "Новая задача",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
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
                    child: GestureDetector(
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 14),
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
                  ),
                  for (int i = 1; i < 10; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 12, bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 14),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: List.generate(
                  options.length,
                  (index) => CheckContainer(
                    value: _selectedIndex ==
                        index, // Проверяем, если индекс выбран
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          _selectedIndex =
                              index; // Устанавливаем выбранный индекс
                          if (_selectedIndex == 1) {
                            visible = !visible;
                          } else {
                            visible = false;
                          }
                        } else {
                          _selectedIndex =
                              null; // Сбрасываем выбор, если чекбокс снимается
                          visible = false;
                        }
                      });
                    },
                    text: options[index],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: visible,
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.compact,
                        checkColor: CoreColors.blue,
                        fillColor: WidgetStatePropertyAll(CoreColors.lightGrey),
                        value: _isChecked2,
                        onChanged: (value) {
                          setState(() {
                            _isChecked2 = value!;
                          });
                        },
                      ),
                      Text("Сернистое")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.compact,
                        checkColor: CoreColors.blue,
                        fillColor: WidgetStatePropertyAll(CoreColors.lightGrey),
                        value: _isChecked3,
                        onChanged: (value) {
                          setState(() {
                            _isChecked3 = value!;
                          });
                        },
                      ),
                      Text("Калиевое")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.compact,
                        checkColor: CoreColors.blue,
                        fillColor: WidgetStatePropertyAll(CoreColors.lightGrey),
                        value: _isChecked4,
                        onChanged: (value) {
                          setState(() {
                            _isChecked4 = value!;
                          });
                        },
                      ),
                      Text("Азотистое")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryBtn(
                text: "В работу",
                onTap: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
