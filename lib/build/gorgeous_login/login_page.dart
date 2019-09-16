import 'package:flutter/material.dart';
import 'package:flutter_homework/build/gorgeous_login/login_tab.dart';
import 'package:flutter_homework/util/ui_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFFfbab66),
                  const Color(0xFFf7418c),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 75.0),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'img/login_logo.png',
                  width: 250.0,
                  height: 200.0,
                ),
              ),
              _selectorBar(),
              Expanded(
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  children: <Widget>[
                    _loginPage(),
                    _registPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //滑动tab
  Widget _selectorBar() {
    return Container(
      width: 260,
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(_pageController),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onLogin,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 16.0, fontFamily: UiUtils.FONT_FAMILY),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onRegist,
                child: Text(
                  "Regist",
                  style: TextStyle(
                      fontSize: 16.0, fontFamily: UiUtils.FONT_FAMILY),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //登录页
  Widget _loginPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          padding:
              EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 40.0),
                child: Card(
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: UiUtils.FONT_FAMILY,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[400],
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.black,
                              size: 16.0,
                            ),
                            hintText: 'PassWord',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: UiUtils.FONT_FAMILY,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFfbab66),
                        offset: Offset(1.0, 6.0),
                        blurRadius: 10.0,
                      ),
                      BoxShadow(
                        color: const Color(0xFFf7418c),
                        offset: Offset(1.0, 6.0),
                        blurRadius: 10.0,
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFf7418c),
                        const Color(0xFFfbab66),
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: EdgeInsets.only(
                      left: 70.0, right: 70.0, top: 5.0, bottom: 5.0),
                  child: MaterialButton(
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: UiUtils.FONT_FAMILY,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Forgot PassWord?',
          style: TextStyle(
            color: Colors.white,
            fontFamily: UiUtils.FONT_FAMILY,
            decoration: TextDecoration.underline,
            fontSize: 16,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 30.0,
            bottom: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 1.0,
                width: 100.0,
                margin: EdgeInsets.only(right: 5.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white10,
                      Colors.white,
                    ],
                  ),
                ),
              ),
              Text(
                'Or',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: UiUtils.FONT_FAMILY,
                ),
              ),
              Container(
                height: 1.0,
                width: 100.0,
                margin: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white10,
                    Colors.white,
                  ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5.0),
              padding: EdgeInsets.all(15.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                FontAwesomeIcons.facebookF,
                color: Colors.blue,
                size: 15.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5.0),
              padding: EdgeInsets.all(15.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                FontAwesomeIcons.google,
                color: Colors.blue,
                size: 15.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  //注册页
  Widget _registPage() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Card(
              color: Colors.white,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: UiUtils.FONT_FAMILY,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[400],
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: UiUtils.FONT_FAMILY,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[400],
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                          size: 16.0,
                        ),
                        hintText: 'PassWord',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: UiUtils.FONT_FAMILY,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[400],
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                          size: 16.0,
                        ),
                        hintText: 'Confirmation',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: UiUtils.FONT_FAMILY,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFfbab66),
                    offset: Offset(1.0, 6.0),
                    blurRadius: 10.0,
                  ),
                  BoxShadow(
                    color: const Color(0xFFf7418c),
                    offset: Offset(1.0, 6.0),
                    blurRadius: 10.0,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFf7418c),
                    const Color(0xFFfbab66),
                  ],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.only(
                  left: 70.0, right: 70.0, top: 5.0, bottom: 5.0),
              child: MaterialButton(
                splashColor: Colors.transparent,
                onPressed: () {},
                child: Text(
                  'REGIST',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: UiUtils.FONT_FAMILY,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onRegist() {
    _pageController.animateToPage(1,
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  void _onLogin() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
