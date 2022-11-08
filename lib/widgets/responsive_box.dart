import 'package:flutter/material.dart';

// class ResponsiveBox extends StatelessWidget {
//   final List<Widget> children;
//   final Color color1;
//   final Color color2;

//   const ResponsiveBox(
//       {super.key,
//       required this.children,
//       required this.color1,
//       required this.color2});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             spreadRadius: 0,
//             blurRadius: 10,
//             offset: Offset(0, 0),
//           ),
//         ],
//         gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             stops: [0.1, 0.1],
//             colors: [color1, color2]),
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
//         child: Container(
//             constraints:
//                 BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: children,
//             )),
//       ),
//     );
//   }
// }

class ResponsiveBox extends StatefulWidget {
  final List<Widget> children;
  final Color color1;
  final Color color2;

  ResponsiveBox(
      {super.key,
      required this.children,
      required this.color1,
      required this.color2});

  @override
  State<ResponsiveBox> createState() => _ResponsiveBoxState();
}

class _ResponsiveBoxState extends State<ResponsiveBox> {
  
  final childrenKey = GlobalKey();
  double ?size;
  double ?height;

  void calculateSize() =>
    WidgetsBinding.instance.addPostFrameCallback((_) {
        final RenderBox box = childrenKey.currentContext?.findRenderObject() as RenderBox;

        setState(() {
          size = box.size.width.toDouble();
          height = box.size.height.toDouble();
        });
        
    });

  @override
  void initState() {
    super.initState();
    calculateSize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              upperContainer(),
              bottomContainer(),
              
            ],
          ),
        ),
        Center(child: buildChildren()),
        
      ],
    );
  }

  Widget bottomContainer() => Container(
    width: size,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 0,
          blurRadius: 10,
        ),
      ],
    ),
  );

  Widget upperContainer() => Container(
    width: size,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      color: Color(0xFFDBEFFA),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 0,
          blurRadius: 10,
        ),
      ],
    ),
  );

  Widget buildChildren() => Container(
    key: childrenKey,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.children,
      ),
    ),
  );
}

