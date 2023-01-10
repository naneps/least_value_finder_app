import 'package:aplikasi_uts/app/common/outline_button.dart';
import 'package:aplikasi_uts/app/modules/home/home_view.dart';
import 'package:aplikasi_uts/app/theme/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _password;
  bool? isLoading = false;
  bool? isPassword = true;
  bool? saveLogin = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_username == "admin" && _password == "admin") {
        if (saveLogin == true) {
          // Simpan username dan password ke dalam local storage
          SpUtil.putBool("isLogin", true);
          SpUtil.putString("username", _username!);
        }
        setState(() {
          isLoading = true;
        });
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
          );
          setState(() {
            isLoading = false;
          });
        });
      } else {
        // Jika username atau password salah, tampilkan konfirmasi kesalahan
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Kesalahan"),
              content: Text("Username atau password salah"),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "Selamat datang di Pencari Nilai Terkecil! Silakan masukkan detail login Anda untuk mengakses aplikasi ini."
              // make typhograpy for this text
              Text(
                "Selamat datang di",
                style: TextStyle(
                  color: DefaultTheme.darkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Text(
                "Pencari Nilai Terkecil",
                style: TextStyle(
                  color: DefaultTheme.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Silakan masukkan detail akun Anda untuk mengakses aplikasi ini.",
                style: TextStyle(
                  color: DefaultTheme.darkColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Silakan masukkan username";
                  }
                  return null;
                },
                onSaved: (value) => _username = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPassword! ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword!;
                      });
                    },
                  ),
                ),
                obscureText: isPassword!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Silakan masukkan password";
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 10),
              // save me with checkBox
              Row(
                children: [
                  Checkbox(
                    activeColor: DefaultTheme.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    value: saveLogin,
                    onChanged: (value) {
                      setState(() {
                        saveLogin = value;
                      });
                    },
                  ),
                  Text(
                    "Ingat saya",
                  ),
                ],
              ),
              SizedBox(height: 10),
              // make button for login
              // make button for login
              Container(
                width: MediaQuery.of(context).size.width,
                child: isLoading!
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            DefaultTheme.secondaryColor,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _submit();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
