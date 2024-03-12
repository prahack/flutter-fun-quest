import 'package:flutter/material.dart';
import 'dart:math' as math;

class LightDarkSwitchApp extends StatelessWidget {
  const LightDarkSwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool _clicked = false;
  bool _changeSunToMoon = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)

      /// Use `addListener` version when running on a emulator with flutter project
      ..addListener(() {
        if (_controller.value == 0.5) {
          setState(() {
            _changeSunToMoon = !_changeSunToMoon;
          });
        }
      });

    /// DartPad version: Since `_controller.value` is not working properly in DartPad,
    // ..addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     setState(() {
    //       _changeSunToMoon = !_changeSunToMoon;
    //     });
    //   } else if (status == AnimationStatus.dismissed) {
    //     setState(() {
    //       _changeSunToMoon = !_changeSunToMoon;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (!_clicked) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            setState(() {
              _clicked = !_clicked;
            });
          },
          child: Container(
            width: 160,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Stack(alignment: Alignment.centerLeft, children: [
                Positioned(
                  top: 0,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -140 * (1 - _animation.value)),
                        child: child!,
                      );
                    },
                    child: background,
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(100 * _animation.value, 0),
                      child: child,
                    );
                  },
                  child: _changeSunToMoon ? moon : sun,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget sun = Padding(
    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Stack(
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget moon = Padding(
    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Stack(
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 25,
          child: Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    ),
  );

  Widget background = Stack(
    children: [
      Container(
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo[900]!, Colors.lightBlue[300]!],
          ),
        ),
      ),
      //stars
      const Positioned(
        top: 10,
        left: 10,
        child: StarContainer(
          size: 10,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 20,
        left: 30,
        child: StarContainer(
          size: 8,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 10,
        left: 50,
        child: StarContainer(
          size: 10,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 20,
        left: 70,
        child: StarContainer(
          size: 8,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 10,
        left: 110,
        child: StarContainer(
          size: 10,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 15,
        left: 85,
        child: StarContainer(
          size: 10,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 40,
        left: 20,
        child: StarContainer(
          size: 10,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 35,
        left: 35,
        child: StarContainer(
          size: 8,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 40,
        left: 55,
        child: StarContainer(
          size: 10,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 35,
        left: 65,
        child: StarContainer(
          size: 8,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 40,
        left: 80,
        child: StarContainer(
          size: 10,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      const Positioned(
        top: 30,
        left: 90,
        child: StarContainer(
          size: 8,
          color: Colors.white,
          armCount: 4,
        ),
      ),
      //cloud set one
      Positioned(
        top: 140,
        left: -50,
        child: CircularContainer(size: 100, color: Colors.lightBlue[50]!),
      ),
      Positioned(
        top: 155,
        left: -30,
        child: CircularContainer(size: 100, color: Colors.lightBlue[50]!),
      ),
      Positioned(
        top: 165,
        left: 40,
        child: CircularContainer(size: 70, color: Colors.lightBlue[50]!),
      ),
      Positioned(
        top: 155,
        left: 85,
        child: CircularContainer(size: 30, color: Colors.lightBlue[50]!),
      ),
      Positioned(
        top: 150,
        left: 110,
        child: CircularContainer(size: 40, color: Colors.lightBlue[50]!),
      ),
      Positioned(
        top: 170,
        left: 90,
        child: CircularContainer(size: 60, color: Colors.lightBlue[50]!),
      ),
      Positioned(
        top: 130,
        left: 140,
        child: CircularContainer(size: 100, color: Colors.lightBlue[50]!),
      ),
      //cloud set two
      Positioned(
        top: 160,
        left: -40,
        child: CircularContainer(size: 100, color: Colors.lightBlue[100]!),
      ),
      Positioned(
        top: 180,
        left: 40,
        child: CircularContainer(size: 40, color: Colors.lightBlue[100]!),
      ),
      Positioned(
        top: 170,
        left: 70,
        child: CircularContainer(size: 40, color: Colors.lightBlue[100]!),
      ),
      Positioned(
        top: 165,
        left: 90,
        child: CircularContainer(size: 60, color: Colors.lightBlue[100]!),
      ),
      Positioned(
        top: 150,
        left: 130,
        child: CircularContainer(size: 90, color: Colors.lightBlue[100]!),
      ),
    ],
  );
}

class CircularContainer extends StatelessWidget {
  final double size;
  final Color color;

  const CircularContainer({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class StarContainer extends StatelessWidget {
  final double size;
  final Color color;
  final int armCount;

  const StarContainer({
    Key? key,
    required this.size,
    required this.color,
    required this.armCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: StarPainter(color, armCount),
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final Color color;
  final int armCount;

  StarPainter(this.color, this.armCount);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    double midX = size.width / 2;
    double midY = size.height / 2;
    double radius = size.width / 2;

    double angleIncrement = (2 * math.pi) / armCount;

    List<Offset> points = [];

    for (int i = 0; i < armCount; i++) {
      double currentAngle = i * angleIncrement - math.pi / 2;
      double x1 = midX + radius * math.cos(currentAngle);
      double y1 = midY + radius * math.sin(currentAngle);
      points.add(Offset(x1, y1));

      currentAngle += angleIncrement / 2; // Shift the angle to create symmetry
      double x2 = midX + (radius * 0.5) * math.cos(currentAngle);
      double y2 = midY + (radius * 0.5) * math.sin(currentAngle);
      points.add(Offset(x2, y2));

      currentAngle += angleIncrement / 2; // Return the angle to the next arm
    }

    Path path = Path()..addPolygon(points, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}