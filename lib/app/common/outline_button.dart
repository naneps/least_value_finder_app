import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  String? label;
  Widget? child;
  Function()? onPressed;
  OutlineButton({
    Key? key,
    this.label,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.greenAccent),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          label ?? "Label",
          style: const TextStyle(
            color: Colors.greenAccent,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
