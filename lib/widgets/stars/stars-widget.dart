import 'package:flutter/material.dart';

class StarsWidget extends StatefulWidget {
  final int count;
  final double size;

  const StarsWidget({Key key, this.count = 0, this.size = 14})
      : super(key: key);
  @override
  _StarsWidgetState createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.count,
        (i) => Icon(
              Icons.star,
              color: Color(0xFFE4BA24),
              size: widget.size,
            ),
      ),
    );
  }
}
