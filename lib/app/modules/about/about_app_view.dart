import 'package:aplikasi_uts/app/theme/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutAppView extends StatelessWidget {
  String? nama;
  String? nim;
  AboutAppView({super.key, this.nama, this.nim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(
            color: DefaultTheme.darkColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: DefaultTheme.darkColor,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                child: Text(
                  "Aplikasi ini dibuat untuk memenuhi tugas UTS mata kuliah Pemrograman Mobile",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Text(
                  "Dibuat oleh:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Table(
                // nama dan nim
                children: [
                  TableRow(
                    children: [
                      Container(
                        child: Text(
                          "Nama",
                          style: TextStyle(
                            color: DefaultTheme.darkColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "NIM",
                          style: TextStyle(
                            color: DefaultTheme.darkColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        child: Text(
                          nama ?? "Nama Mu",
                          style: TextStyle(
                            color: DefaultTheme.darkColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          nim ?? "Nim mu",
                          style: TextStyle(
                            color: DefaultTheme.darkColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
