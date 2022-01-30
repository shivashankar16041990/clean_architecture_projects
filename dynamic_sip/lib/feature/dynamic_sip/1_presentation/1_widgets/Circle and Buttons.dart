import 'package:dynamic_sip/core/CustomPainter/CustomPainter.dart';
import 'package:dynamic_sip/feature/dynamic_sip/1_presentation/Provider/Value%20Provider/LeftRightValue.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/2_entities/Entity.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class CircleandButtons extends StatefulWidget {
  CircleandButtons({Key? key, required this.datalist}) : super(key: key);
  List<Dsip> datalist;

  @override
  State<CircleandButtons> createState() => _CircleandButtonsState();
}

class _CircleandButtonsState extends State<CircleandButtons> {

  @override
  Widget build(BuildContext context) {

    var left = context.watch<LeftRightValue>().left;
    var right = context.watch<LeftRightValue>().right;
    var prevright = context.watch<LeftRightValue>().prevright;

    return Scaffold(
        //backgroundColor: context.watch<LeftRightValue>().bgColor,
        body: SingleChildScrollView(
            child: Center(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(
        "Dynamic SIP",
        textScaleFactor: 2,
      ),
      Text("Earn more than normal SIP"),
      SizedBox(
        height: 50,
      ),
      Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                        begin: double.parse(prevright),
                        end: double.parse(right)),
                    duration: const Duration(seconds: 2),
                    builder:
                        (BuildContext context, double size, Widget? child) {
                      return CustomPaint(
                        foregroundPainter: MyPainter(
                          lineColor: Colors.green,
                          completeColor: Colors.orange,
                          width: 60,
                          completePercent: size,
                        ),
                      );
                    }),
              ),
              Positioned.fill(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: CustomSizeText(
                      left: double.parse(left),
                      right: double.parse(right),
                      prevright: double.parse(prevright)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GridView.count(
            childAspectRatio: (3 / 1),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: widget.datalist
                .map((e) => ElevatedButton(
                    onPressed: () async {
                      context
                          .read<LeftRightValue>()
                          .update(rightValue: e.equity);
                      //    await Future.delayed(Duration(seconds:1));
                    },
                    child: Text(e.date)))
                .toList(),
          )
        ],
      )
    ]))));
  }

  Widget CustomSizeText(
      {required double right,
      required double left,
      required double prevright}) {



    double prevleft = 100 - prevright;

    /*print(" minvalueleft $minvalueleft");
    print("maxvalueleft  $maxvalueleft");*/

    print(" begin:(prevleft/8.33)+12 ${(prevleft/8.33)+12}");
    print(" end:(left/8.33)+12   ${(left/8.33)+12}");

    return Stack(
      children: [
        TweenAnimationBuilder<double>(
            tween: Tween<double>(begin:(prevleft/8.33)+12 , end:(left/8.33)+12 ),
            duration: const Duration(seconds: 2),
            builder: (BuildContext context, double size, Widget? child) {
              return Positioned(
                left: 15,
                top: 30+10.23*(size-12),
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '${left.toInt()} % ',
                          style: TextStyle(color: Colors.green)),
                      TextSpan(text: '\nFixed Income'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size,
                  ),
                ),
              );
            }),
        TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: (prevright/2)+12, end:(right/8.33)+12),
            duration: const Duration(seconds: 2),
            builder: (BuildContext context, double size, Widget? child) {
              return Positioned(
                right: 15,
                top: 30+10.23*(size-12),
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '${right.toInt()} % ',
                          style: TextStyle(color: Colors.orange)),
                      TextSpan(
                        text: '\nShare Market',
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size),
                ),
              );
            })
      ],
    );
  }
}
