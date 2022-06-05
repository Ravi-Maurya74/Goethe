import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardchild;
  ReusableCard({required this.cardchild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: cardchild,
    );
  }
}

class LoadWidget extends StatelessWidget {
  const LoadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      size: 100,
      color: Colors.white,
    );
  }
}
