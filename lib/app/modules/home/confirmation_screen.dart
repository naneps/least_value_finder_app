import 'package:aplikasi_uts/app/modules/home/home_view.dart';
import 'package:aplikasi_uts/app/theme/default_theme.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final double? min;

  const ConfirmationScreen({Key? key, this.min}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 200,
              decoration: BoxDecoration(
                color: DefaultTheme.infoColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(112, 59, 59, 59),
                    blurRadius: 7,
                    spreadRadius: 2,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nilai terkecil adalah " + min!.toInt().toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                  // shown notification data success saved
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Data Telah Disimpan!",
                        style: TextStyle(
                          color: DefaultTheme.darkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: DefaultTheme.successColor,
                      onVisible: () {
                        // navigate to home screen
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const HomeView();
                          },
                        ));
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.save,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
