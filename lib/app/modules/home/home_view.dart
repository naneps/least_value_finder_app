import 'package:aplikasi_uts/app/modules/auth/aurh_view.dart';
import 'package:aplikasi_uts/app/modules/home/confirmation_screen.dart';
import 'package:aplikasi_uts/app/theme/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  double? _num1, _num2, _num3, _num4;
  bool? isLoading = false;
  AnimationController? _controller;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  void resetAll() {
    setState(() {
      _formKey.currentState!.reset();
    });
  }

  double getMin(List<double?> numbers) {
    double? min =
        numbers.reduce((value, element) => value! < element! ? value : element);
    return min!;
  }

  void _findMin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      List<double?> numbers = [_num1, _num2, _num3, _num4];
      // get min value of numbers
      double? min = getMin(numbers);
      // set isLoading to true for 1.5 second
      setState(() {
        isLoading = true;
      });
      Future.delayed(const Duration(milliseconds: 1500), () {
        setState(() {
          isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmationScreen(min: min),
          ),
        );
        resetAll();
      });
    }
  }

  void logout() {
    SpUtil.putBool("isLogin", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AuthView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi UTS"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: DefaultTheme.primaryColor,
        actions: [
          // dropdown action
          PopupMenuButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: InkWell(
                onTap: () {
                  logout();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("keluar"),
                    Icon(
                      Icons.exit_to_app,
                      color: DefaultTheme.primaryColor,
                    )
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Reset",
        backgroundColor: DefaultTheme.primaryColor,
        onPressed: () {
          resetAll();
          setState(() {
            isPressed = !isPressed;
          });
          if (isPressed) {
            _controller!.forward();
          } else {
            _controller!.reset();
            _controller!.forward();
          }
        },
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller!),
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
            semanticLabel: "Reset",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: DefaultTheme.infoColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 191, 191, 191),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      // icon info
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Masukkan 4 nilai pada setiap inputan untuk mencari inlai terkecil",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Nilai 1"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Silakan masukkan nilai 1";
                        }
                        return null;
                      },
                      onSaved: (value) => _num1 = double.parse(value!),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Nilai 2"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Silakan masukkan nilai 2";
                        }
                        return null;
                      },
                      onSaved: (value) => _num2 = double.parse(value!),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Nilai 3"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Silakan masukkan nilai 3";
                        }
                        return null;
                      },
                      onSaved: (value) => _num3 = double.parse(value!),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Nilai 4"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Sil akan masukkan nilai 4";
                        }
                        return null;
                      },
                      onSaved: (value) => _num4 = double.parse(value!),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      child: isLoading!
                          ? CircularProgressIndicator(
                              color: DefaultTheme.primaryColor,
                            )
                          : ElevatedButton(
                              onPressed: () {
                                _findMin();
                              },
                              child: Container(
                                // margin: EdgeInsets.symmetric(vertical: ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Cari Nilai Terkecil",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.search,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
