import 'package:cgpa_challenge/Services/provider.dart';
import 'package:cgpa_challenge/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/gpa_model.dart';
import 'homepage.dart';

class AddPage extends StatefulWidget {
  final Entry? entry;
  const AddPage({this.entry});
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var _newCourseEntry = Entry(
    credit: '',
    grade: '',
    title: '',
    unit: 0,
  );
  TextEditingController _controller = TextEditingController();
  String _currentSelect = 'A';
  int _currentItemSelect = 1;
  List<int> credit = [1, 2, 3, 4];
  int dropdownValue = 0;
  final _containerKey = GlobalKey<FormState>();
  void saveResult() {
    final isValid = _containerKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _containerKey.currentState!.save();
    context.read<Entries>().addToCard(_newCourseEntry);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Please Input Your Data',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Form(
              key: _containerKey,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you need to input a course';
                          } else if (value.length < 4) {
                            return 'input cant be less than 4';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _newCourseEntry = Entry(
                              credit: _newCourseEntry.credit,
                              unit: _newCourseEntry.unit,
                              grade: _newCourseEntry.grade,
                              title: newValue);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                labelText: 'Credit point',
                                labelStyle: TextStyle(
                                    fontSize: 25, color: Utils.textColor)),
                            value: _currentItemSelect,
                            items: const [
                              DropdownMenuItem<int>(
                                value: 5,
                                child: Text('5'),
                              ),
                              DropdownMenuItem<int>(
                                value: 4,
                                child: Text('4'),
                              ),
                              DropdownMenuItem<int>(
                                value: 3,
                                child: Text('3'),
                              ),
                              DropdownMenuItem<int>(
                                value: 2,
                                child: Text('2'),
                              ),
                              DropdownMenuItem<int>(
                                value: 1,
                                child: Text('1'),
                              ),
                            ],
                            onChanged: (newvalue) {
                              setState(() {
                                _currentItemSelect = newvalue as int;
                              });
                            },
                            onSaved: ((newValue) {
                              _newCourseEntry = Entry(
                                  credit: _newCourseEntry.credit,
                                  unit: newValue as int,
                                  grade: _newCourseEntry.grade,
                                  title: _newCourseEntry.title);
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                labelText: 'Grade',
                                labelStyle: TextStyle(
                                    fontSize: 25, color: Utils.textColor)),
                            value: _currentSelect,
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'A',
                                child: Text('A'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'B',
                                child: Text('B'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'C',
                                child: Text('C'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'D',
                                child: Text('D'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'F',
                                child: Text('F'),
                              ),
                            ],
                            onChanged: (newvalue) {
                              setState(() {
                                _currentSelect = newvalue.toString();
                              });
                            },
                            onSaved: (value) {
                              _newCourseEntry = Entry(
                                  credit: _newCourseEntry.credit,
                                  unit: _newCourseEntry.unit,
                                  grade: value as String,
                                  title: _newCourseEntry.title);
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                saveResult();
                              },
                              child: const Text('Submit')),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
