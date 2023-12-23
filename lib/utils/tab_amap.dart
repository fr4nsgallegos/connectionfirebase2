import 'package:conectionfirebase2/pages/create_page.dart';
import 'package:conectionfirebase2/pages/home_page.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> pageDetails = [
  {
    "pageName": HomePage(bgColor: Color(0xfffdf0d5)),
    "navigationBarColor": Color(0xfffdf0d5),
    "botton_color": Color(0xffd6ccc2)
  },
  {
    "pageName": CreatePage(bgColor: Color(0xff003049).withOpacity(0.8)),
    "navigationBarColor": Color(0xff003049).withOpacity(0.8),
    "botton_color": Color(0xff003049)
  },
  {
    "pageName": HomePage(bgColor: Color(0xff669bbc).withOpacity(0.2)),
    "navigationBarColor": Color(0xff669bbc).withOpacity(0.2),
    "botton_color": Colors.cyan.shade900
  }
];
