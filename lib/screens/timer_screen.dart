import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/size_config.dart';

class TimerScreen extends StatefulWidget {
  static const String routeName = '/timer';
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const maxSeconds = 5 * 60;
  int seconds = maxSeconds;

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    int minuts = (seconds / 60).floor();
    int secondsDisplayed = (seconds % 60).floor();
    void startTimer() {
      timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) {
          if (seconds > 0) {
            setState(
              () {
                seconds--;
              },
            );
          } else {
            timer.cancel();
          }
        },
      );
    }

    void resetTimer() => setState(() {
          seconds = maxSeconds;
        });

    void stopTimer({bool? reset}) {
      if (reset == true) {
        resetTimer();
      } else {
        timer?.cancel();
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffD6BCD2),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildContainerHeader(onTap: () {
                Navigator.pop(context);
              }),
              Text(
                'ESTUDAR\nMATEMÁTICA',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Fira Sans',
                    fontSize: getProportionateScreenWidth(27),
                    color: Color(0xffD572C8),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              BuildCenterCountDown(minuts, secondsDisplayed),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildButton(startTimer, stopTimer),
                  GestureDetector(
                    onTap: () {
                      stopTimer(reset: true);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.verified_outlined,
                          color: Color(0xff5C6E8D),
                          size: getProportionateScreenWidth(40),
                        ),
                        Text(
                          'DONE',
                          style: TextStyle(
                              fontFamily: 'Baloo',
                              fontSize: getProportionateScreenWidth(20),
                              color: Color(0xff5C6E8D),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.all(
            getProportionateScreenWidth(25),
          ),
          width: getProportionateScreenWidth(412),
          height: getProportionateScreenHeight(780),
          decoration: BoxDecoration(
            color: Color(0xff2B2E44),
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(20),
            ),
          ),
        ),
      ),
    );
  }

  Row BuildContainerHeader({Function? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap as void Function(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff9EAEC7),
            size: getProportionateScreenHeight(25),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 50,
            height: 58,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/clock.png'),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox BuildCenterCountDown(int minuts, int secondsDisplayed) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            backgroundColor: Color(0xff282A37),
            strokeWidth: getProportionateScreenWidth(17),
            value: seconds / maxSeconds,
            color: Color(0xff9EAEC7),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: getProportionateScreenWidth(80),
                  height: getProportionateScreenHeight(120),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/cactus.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Color(0xff9EAEC7),
                        fontSize: getProportionateScreenWidth(44),
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: minuts.toString().padLeft(2, '0'),
                      ),
                      TextSpan(text: ':'),
                      TextSpan(
                        text: secondsDisplayed.toString().padLeft(2, '0'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildButton(void startTimer(), void stopTimer()) {
    final isRunning = timer == null ? false : timer!.isActive;

    return isRunning
        ? GestureDetector(
            onTap: () {
              setState(() {
                stopTimer();
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.pause_outlined,
                  color: Color(0xff5C6E8D),
                  size: getProportionateScreenWidth(40),
                ),
                Text(
                  'PAUSE',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: getProportionateScreenWidth(20),
                      color: Color(0xff5C6E8D),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                startTimer();
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.play_arrow_rounded,
                  color: Color(0xff5C6E8D),
                  size: getProportionateScreenWidth(40),
                ),
                Text(
                  'PLAY',
                  style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: getProportionateScreenWidth(20),
                      color: Color(0xff5C6E8D),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
  }

  Widget buildPauseButton() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Icon(
            Icons.pause_outlined,
            color: Color(0xff5C6E8D),
          ),
          Text(
            'Pause',
            style: TextStyle(
                fontFamily: 'Baloo',
                fontSize: getProportionateScreenWidth(15),
                color: Color(0xff5C6E8D),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
