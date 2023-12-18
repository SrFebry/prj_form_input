import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String result = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? nama;
  String? religion;
  String? education;
  String? gender;
  bool? isChecked = false;
  List<String> religionOptions = [
    'Islam',
    'Kristen',
    'Katolik',
    'Buddha',
    'Kong Hu Cu',
  ];
  List<String> educationOptions = [
    'SD',
    'SMP',
    'SMA',
    'S1',
    'S2',
    'S3',
  ];

  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      setState(() {
        result =
            "Nama : $nama \n Gender: $gender \n Religion : $religion \n Education : $education \n Setuju : $isChecked";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  nama = value;
                },
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Agama',
                ),
                value: religion,
                items: religionOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    religion = newValue;
                  });
                },
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Pendidikan',
                ),
                value: education,
                items: educationOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    education = newValue;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(
                "Jenis Kelamin",
                style: TextStyle(fontSize: 12),
              ),
              RadioListTile(
                title: Text("Laki-Laki"),
                value: "Laki-Laki",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Perempuan"),
                value: "Perempuan",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  Text('Setuju'),
                ],
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
              SizedBox(height: 20.0),
              Text(
                result,
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
