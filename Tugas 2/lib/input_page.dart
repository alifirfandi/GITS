import 'package:flutter/material.dart';

enum PriorityType { SILVER, GOLD, PLATINUM }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  PriorityType? _priorityTypeSelected;
  bool _isPopcorn = false;
  bool _isCola = false;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 1, 1),
        lastDate: DateTime(2050, 1, 1));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(
        () {
          selectedTime = picked;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Text(
              'Book ticket for :',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            Text(
              'BoBoiBoy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your name here';
                  }
                  return null;
                },
                controller: _nameController,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 18),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Date',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Text(
                  "${_changeDateFormat(selectedDate)}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Time',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Text(
                  "${selectedTime.format(context)}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                  onPressed: () => _selectTime(context),
                  icon: Icon(
                    Icons.watch_later,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Priority',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                  RadioListTile<PriorityType>(
                    activeColor: Colors.white,
                    title: Text(
                      'Silver',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: PriorityType.SILVER,
                    groupValue: _priorityTypeSelected,
                    onChanged: (PriorityType? value) {
                      setState(() {
                        _priorityTypeSelected = value;
                      });
                    },
                  ),
                  RadioListTile<PriorityType>(
                    activeColor: Colors.white,
                    title: Text(
                      'Gold',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: PriorityType.GOLD,
                    groupValue: _priorityTypeSelected,
                    onChanged: (PriorityType? value) {
                      setState(() {
                        _priorityTypeSelected = value;
                      });
                    },
                  ),
                  RadioListTile<PriorityType>(
                    activeColor: Colors.white,
                    title: Text(
                      'Platinum',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: PriorityType.PLATINUM,
                    groupValue: _priorityTypeSelected,
                    onChanged: (PriorityType? value) {
                      setState(() {
                        _priorityTypeSelected = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Text(
              'Add Snacks',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            LabeledCheckbox(
              label: 'Popcorn',
              value: _isPopcorn,
              onChanged: (bool newValue) {
                setState(() {
                  _isPopcorn = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'Cola',
              value: _isCola,
              onChanged: (bool newValue) {
                setState(() {
                  _isCola = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate() ||
                    _priorityTypeSelected == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill and select all form'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else
                  _submitAndShowDialog();
              },
              child: Text(
                'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitAndShowDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _changeDateFormat(selectedDate),
                        style: TextStyle(fontSize: 20),
                      ),
                      _getPriority(_priorityTypeSelected)
                    ],
                  ),
                  Text(
                    selectedTime.format(context),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Name'),
                  Text(
                    _nameController.text,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Snacks : '),
                  _getSnack(_isPopcorn, _isCola)
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget _getSnack(bool isPopcorn, bool isCola) {
    if (isPopcorn && isCola) {
      return Text(
        'Popcorn, Cola',
        style: TextStyle(fontSize: 20),
      );
    } else if (isPopcorn) {
      return Text(
        'Popcorn',
        style: TextStyle(fontSize: 20),
      );
    } else if (isCola) {
      return Text(
        'Cola',
        style: TextStyle(fontSize: 20),
      );
    } else {
      return Text(
        '-',
        style: TextStyle(fontSize: 20),
      );
    }
  }

  Widget _getPriority(PriorityType? priorityType) {
    switch (priorityType) {
      case PriorityType.SILVER:
        return Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: Text(
            'Silver',
            style: TextStyle(color: Colors.white),
          ),
        );
      case PriorityType.GOLD:
        return Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow[700],
          ),
          child: Text(
            'Gold',
            style: TextStyle(color: Colors.white),
          ),
        );
      case PriorityType.PLATINUM:
        return Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[700],
          ),
          child: Text(
            'Platinum',
            style: TextStyle(color: Colors.white),
          ),
        );
      default:
        return Container(
          color: Colors.red,
          child: Text(
            '-',
          ),
        );
    }
  }

  String _changeDateFormat(DateTime date) {
    String day =
        date.day > 10 ? date.day.toString() : "0${date.day.toString()}";
    String month = '';
    switch (date.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      case 12:
        month = 'Dec';
        break;
    }
    String year = date.year.toString();

    return "$day $month $year";
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: <Widget>[
            Checkbox(
              checkColor: Colors.black,
              fillColor: MaterialStateProperty.all(Colors.white),
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
                child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
          ],
        ),
      ),
    );
  }
}
