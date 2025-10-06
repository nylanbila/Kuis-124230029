import 'package:flutter/material.dart';
import 'buku_grid.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  void _login() {
    if (usernameC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      if (passwordC.text == '029') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Berhasil!"),
            backgroundColor: Color.fromARGB(255, 114, 209, 117),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => BukuGridPage(username: usernameC.text),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Username atau password salah!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Masukkan Username dan password!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Login Screen'),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/upn.png', width: 200, height: 100),
            Padding(
              padding: EdgeInsets.all(16.0), // padding di semua sisi
              child: TextField(
                controller: usernameC,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'username',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordC,
                enabled: true,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'Password',
                ),
              ),
            ),

            ElevatedButton(
              onPressed: _login,
              child: const Text('login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: const Color.fromARGB(255, 253, 255, 254),
              ),
            ),
          ],
        ),
      ), //body berada di strata yg sama dengan appBar
    );
  }
}
