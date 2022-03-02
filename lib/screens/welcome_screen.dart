import 'package:flutter/material.dart';
import 'package:flutter_application/screens/reminder_screen.dart';
import 'package:flutter_application/size_config.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            StarLeftTop(),
            FireWorks(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(18),
                ),
                color: Color(0xff2B2E44),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(180),
                        child: FittedBox(
                          child: BalooBoldText(
                            text: 'Bem-vindo\nà nossa toca!',
                            fontSize: getProportionateScreenWidth(30),
                          ),
                        ),
                      ),
                      Image(image: AssetImage('assets/images/coelho.png'))
                    ],
                  ),
                  BalooBoldText(
                    text: 'Suas novas funcionalidades:',
                    fontSize: getProportionateScreenWidth(20),
                  ),
                  Funcionalidades(),
                  Center(
                    child: BalooBoldText(
                      text: 'Nosso Heroí!',
                      fontSize: getProportionateScreenWidth(30),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Queremos lhe agradecer por estar\n conosco. A Jornada Premium lhe aguarda.',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Baloo',
                        fontSize: getProportionateScreenWidth(15),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(28),
                getProportionateScreenHeight(180),
                getProportionateScreenWidth(28),
                getProportionateScreenHeight(80),
              ),
              padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(36),
                getProportionateScreenHeight(40),
                getProportionateScreenWidth(36),
                getProportionateScreenHeight(40),
              ),
              height: getProportionateScreenHeight(620),
              width: getProportionateScreenWidth(372),
            ),
            WelcomeButton(),
            BottomStar(),
          ],
        ),
      ),
    );
  }

  Positioned BottomStar() {
    return Positioned(
      bottom: getProportionateScreenHeight(43),
      right: getProportionateScreenWidth(12),
      child: Image(
        image: AssetImage('assets/images/brilho.png'),
      ),
    );
  }

  Positioned WelcomeButton() {
    return Positioned(
      bottom: getProportionateScreenHeight(60),
      left: getProportionateScreenWidth(120),
      right: getProportionateScreenWidth(120),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ReminderScreen.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff7C78E6),
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(25),
            ),
          ),
          width: getProportionateScreenWidth(188),
          height: getProportionateScreenHeight(50),
          child: Center(
            child: FittedBox(
              child: Text(
                'Vamos lá',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Fira Sans',
                    fontSize: getProportionateScreenWidth(27),
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Positioned FireWorks() {
    return Positioned(
      top: getProportionateScreenHeight(34),
      right: getProportionateScreenWidth(50),
      child: Image(
        image: AssetImage('assets/images/Stars.png'),
      ),
    );
  }

  Positioned StarLeftTop() {
    return Positioned(
      top: getProportionateScreenHeight(130),
      left: getProportionateScreenWidth(40),
      child: Image(
        image: AssetImage('assets/images/brilhoTop.png'),
      ),
    );
  }

  Row Funcionalidades() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildFuncionalidadeText(text: 'Metas'),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            BuildFuncionalidadeText(text: 'Rotinas'),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            BuildFuncionalidadeText(text: '2x Moedas'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildFuncionalidadeText(text: 'To Do list'),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            BuildFuncionalidadeText(text: 'Salvar na núvem'),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            BuildFuncionalidadeText(text: 'Marcar dias anteriores'),
          ],
        ),
      ],
    );
  }

  Row BuildFuncionalidadeText({required String text}) {
    return Row(
      children: [
        Icon(
          Icons.verified_rounded,
          color: Color(0xff9CFCE6),
          size: getProportionateScreenWidth(19),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: 'Baloo',
              fontSize: getProportionateScreenWidth(15),
              color: Color(0xff9EAEC7)),
        )
      ],
    );
  }

  Text BalooBoldText({double? fontSize, required String text}) {
    return Text(
      text,
      softWrap: false,
      style: TextStyle(
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'Baloo',
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
