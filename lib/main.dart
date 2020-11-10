import 'package:flutter/material.dart';
import 'page_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageLogin(),
    );
  }
}

class PageLogin extends StatelessWidget {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Login'),
        backgroundColor: Colors.orange,
      ),

      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              //cek data field nya kosong
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Input Username';
                }
                return null;
              },

              controller: myUsernameController,
              decoration: InputDecoration(
                hintText: 'Input Username',
              ),
            ),
            TextFormField(
              //cek data field nya kosong
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Input Username';
                }
                return null;
              },
              maxLength: 16,
              maxLengthEnforced: true,
              controller: myPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Input Password',
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              minWidth: 85.0,
              height: 50.0,
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {

                //cek apakah username = nindi
                //cek password < 5 : gak bisa login, >5 bisa login

                //ngambil value dari widget textfield
                nUsername = myUsernameController.text;
                nPassword = myPasswordController.text;

                if (_formKey.currentState.validate()) {

                  if(nUsername != 'nindi'){
                    print("username salah");
                  }else if(nPassword.length <= 5){
                    print("password harus lebih dari 5 ");
                  }else{
                    //aksi pindah
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pagehome(
                              nama: nUsername,
                              password: 
                              nPassword, // variable yang di pass ke page home
                            )));
                  }
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),

    );
  }
}