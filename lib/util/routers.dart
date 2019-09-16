import 'package:flutter/material.dart';
import 'package:flutter_homework/build/gorgeous_login/login_page.dart';
import 'package:flutter_homework/build/squatting/squatting_home.dart';
import 'package:flutter_homework/build/squatting/squatting_info.dart';
import 'package:flutter_homework/build/squatting/squatting_welcome.dart';
import 'package:flutter_homework/pull_refresh/pull_refresh.dart';

class Routers {
  static const Pull_Refresh = 'pull_refresh';
  static const Gorgeous_Login = 'Gorgeous_Login';
  static const Squatting_Welcome = 'Squatting_Welcome';
  static const Squatting_Home = 'Squatting_Home';
  static const Squatting_Info = 'Squatting_Info';
  static Map<String, WidgetBuilder> RouterMap = {
    Pull_Refresh: (builder) => PullRefresh(),
    Gorgeous_Login: (builder) => LoginPage(),
    Squatting_Welcome: (builder) => SquattingWelcome(),
    Squatting_Home: (builder) => SquattingHome(),
    Squatting_Info: (builder) => SquattingInfo(),
  };

  static Map<String, WidgetBuilder> initRouter() {
    return RouterMap;
  }

  static void routePage(BuildContext context, String routeHost, {Object args}) {
    WidgetBuilder builder = null;
    RouterMap.forEach((key, value) {
      if (key == routeHost) {
        builder = value;
        return;
      }
    });
    Navigator.push(context, MaterialPageRoute(builder: builder));
  }

  static void routePageWithRemove(BuildContext context, String routeName,
      {Object args}) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (router) => true,
        arguments: args);
  }
}
