import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/entryPage.svg')),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text(
                'Step 1',
                style: GoogleFonts.righteous(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(55, 163, 241, 1)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: Text('Turn on device and connect wifi',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(65, 65, 65, 1),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text(
                'Step 2',
                style: GoogleFonts.righteous(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(55, 163, 241, 1)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              width: double.infinity,
              child: Text('Go to this link',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(65, 65, 65, 1),
                  )),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                width: double.infinity,
                child: InkWell(
                  child: Text('http://localhost:5000',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(51, 102, 187, 1),
                      )),
                  onTap: () => launch('http://localhost:5000'),
                )),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text(
                'Step 3',
                style: GoogleFonts.righteous(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(55, 163, 241, 1)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: Text('Save your wifi ssid and password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(65, 65, 65, 1),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text(
                'Step 4',
                style: GoogleFonts.righteous(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(55, 163, 241, 1)),
              ),
            ),
            MyCustomForm(),
          ],
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 200.0,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Device Uniquie ID',
                ),
              )),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
