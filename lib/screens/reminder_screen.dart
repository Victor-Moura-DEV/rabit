import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/timer_screen.dart';
import 'package:flutter_application/size_config.dart';

class ReminderScreen extends StatefulWidget {
  static const String routeName = '/reminder';

  const ReminderScreen({Key? key}) : super(key: key);

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List hours = [];
  List minutes = [];

  getHour() {
    for (var i = 0; i < 24; i++) {
      hours.add(
        i.toString().padLeft(2, '0'),
      );
    }
  }

  getMinutes() {
    for (var i = 0; i < 60; i++) {
      minutes.add(
        i.toString().padLeft(2, '0'),
      );
    }
  }

  @override
  void initState() {
    getHour();
    getMinutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(20),
            ),
          ),
          padding: EdgeInsets.only(
            top: getProportionateScreenHeight(29),
          ),
          width: getProportionateScreenWidth(369),
          height: getProportionateScreenHeight(394),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Horário de lembrete',
                style: TextStyle(
                  fontFamily: 'Fira Sans',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff5C6E8D),
                  fontSize: getProportionateScreenWidth(23),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HourMinutesDivider(),
                  TimePicker(
                    childrenList:
                        hours.map((hour) => WheelText(text: hour)).toList(),
                  ),
                  HourMinutesDivider(),
                  TimePicker(
                    childrenList: minutes
                        .map((minutes) => WheelText(text: minutes))
                        .toList(),
                  ),
                  HourMinutesDivider(),
                ],
              ),
              RemiderButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Container RemiderButton(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CancelButton(context),
          VerticalDivider(
            color: Colors.white,
            thickness: 0.2,
            width: getProportionateScreenWidth(10),
            indent: getProportionateScreenHeight(10),
            endIndent: getProportionateScreenHeight(10),
          ),
          SelectedButton(context),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            getProportionateScreenWidth(19),
          ),
          bottomRight: Radius.circular(
            getProportionateScreenWidth(19),
          ),
        ),
        color: Color(0xff2B2E44),
      ),
      width: getProportionateScreenWidth(369),
      height: getProportionateScreenHeight(80),
    );
  }

  Container TimePicker({required List<Widget> childrenList}) {
    return Container(
      width: getProportionateScreenWidth(50),
      height: getProportionateScreenHeight(160),
      child: CupertinoPicker(
        itemExtent: 50,
        onSelectedItemChanged: (int index) {},
        children: childrenList,
        selectionOverlay: null,
      ),
    );
  }

  VerticalDivider HourMinutesDivider() {
    return VerticalDivider(
      color: Colors.black,
      endIndent: getProportionateScreenWidth(20),
      indent: getProportionateScreenWidth(20),
      width: getProportionateScreenWidth(60),
      thickness: 1,
    );
  }

  GestureDetector SelectedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TimerScreen.routeName);
      },
      child: Container(
        width: getProportionateScreenWidth(140),
        child: Center(
          child: Text(
            'Selecionar',
            style: TextStyle(
                fontFamily: 'Fira Sans',
                fontWeight: FontWeight.w600,
                fontSize: getProportionateScreenWidth(20),
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  GestureDetector CancelButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TimerScreen.routeName);
      },
      child: Container(
        width: getProportionateScreenWidth(140),
        child: Center(
          child: Text(
            'Cancelar',
            style: TextStyle(
                fontFamily: 'Fira Sans',
                fontWeight: FontWeight.w600,
                fontSize: getProportionateScreenWidth(20),
                color: Colors.white.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }

  Widget WheelText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Fira Sans',
        fontSize: getProportionateScreenWidth(30),
        fontWeight: FontWeight.w700,
        color: Color(0xff2B2E44),
      ),
    );
  }
}
