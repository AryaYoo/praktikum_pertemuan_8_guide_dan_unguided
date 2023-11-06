//============================================Guided======================================
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
          centerTitle: true,
          title: Text('Gesture App'),
        ),
        body: Column(
          children: [
            HorizontalDrag(),
            Divider(),
            VerticalDrag(),
          ],
        ),
      ),
    );
  }
}

class HorizontalDrag extends StatefulWidget {
  const HorizontalDrag({super.key});
  @override
  State<HorizontalDrag> createState() => _HorizontalDragState();
}

class _HorizontalDragState extends State<HorizontalDrag> {
  bool _dragging = false;
  Offset _move = Offset.zero;
  int _DragCount = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        setState(() {
          _move = Offset.zero;
          _dragging = true;
        });
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          _move += details.delta;
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        setState(() {
          _dragging = false;
          _DragCount++;
        });
      },
      child: Container(
        color: Colors.grey,
        child: Center(
          child: Transform.translate(
            offset: _move,
            child: Text(
              _dragging ? "DRAGGING" : "Drags: $_DragCount",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalDrag extends StatefulWidget {
  const VerticalDrag({Key? key}) : super(key: key);

  @override
  _VerticalDragState createState() => _VerticalDragState();
}

class _VerticalDragState extends State<VerticalDrag> {
  bool _dragging = false;
  Offset _move = Offset.zero;
  int _dragCount = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (DragStartDetails details) {
        setState(() {
          _move = Offset.zero;
          _dragging = true;
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          _move += details.delta;
        });
      },
      onVerticalDragEnd: (DragEndDetails details) {
        setState(() {
          _dragging = false; // Setel _dragging menjadi false saat drag selesai
          _dragCount++;
        });
      },
      child: Container(
        height: 500,
        color: Colors.grey,
        child: Center(
          child: Transform.translate(
            offset: _move,
            child: Text(
              _dragging ? "DRAGGING" : "Drags: $_dragCount",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}



//============================================Unguided======================================

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('OnPan App'),
//         ),
//         body: Column(
//           children: [
//             Container(
//               height: 100,
//             ),
//             PanDrag(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PanDrag extends StatefulWidget {
//   const PanDrag({super.key});
//   @override
//   State<PanDrag> createState() => _PanDragState();
// }

// class _PanDragState extends State<PanDrag> {
//   bool _dragging = false;
//   Offset _move = Offset.zero;
//   int _DragCount = 0;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanStart: (DragStartDetails details) {
//         print(details);
//         setState(() {
//           _move = Offset.zero;
//           _dragging = true;
//         });
//       },
//       onPanUpdate: (DragUpdateDetails details) {
//         print(details);
//         setState(() {
//           _move += details.delta;
//         });
//       },
//       onPanEnd: (DragEndDetails details) {
//         print("Sudah Di Update");
//         print(details);
//         setState(() {
//           _dragging = false;
//           _DragCount++;
//         });
//       },
//       child: Container(
//         color: Colors.blue,
//         height: 200,
//         width: 200,
//         child: Center(
//           child: Transform.translate(offset: _move),
//         ),
//       ),
//     );
//   }
// }