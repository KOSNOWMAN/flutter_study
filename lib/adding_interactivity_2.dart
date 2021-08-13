import 'package:flutter/material.dart';

//------------------------- MyApp ----------------------------------

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: ParentWidget(),
        ),
      ),
    );
  }
}

// ParentWidget manages the state for TapboxB.

//------------------------ ParentWidget --------------------------------


class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  // 상태관리
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged, // 콜백이 도착하면 호출됨
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

// stateless 위젯을 사용 : 상태관리는 부모 위젯에서
class TapboxB extends StatelessWidget {
  const TapboxB({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged; // 콜백사용하여 부모위젯에게 상태를 알려준다.

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap, // 사용자가 클릭하면 호출
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

