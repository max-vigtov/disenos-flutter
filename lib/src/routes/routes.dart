import 'package:disenos_flutter/src/pages/animaciones_page.dart';
import 'package:disenos_flutter/src/pages/circular_graphics_page.dart';
import 'package:disenos_flutter/src/pages/emergency_page.dart';
import 'package:disenos_flutter/src/pages/headers_page.dart';
import 'package:disenos_flutter/src/pages/pinterest_page.dart';
import 'package:disenos_flutter/src/pages/slideshow_page.dart';
import 'package:disenos_flutter/src/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = [

  _Route( icon: FontAwesomeIcons.slideshare, title: 'Slideshow', page: const SlideshowPage() ),
  _Route( icon: FontAwesomeIcons.truckMedical, title: 'Emergency', page: const EmergencyPage() ),
  _Route( icon: FontAwesomeIcons.heading, title: 'Headers', page: const HeadersPage() ),
  _Route( icon: FontAwesomeIcons.peopleCarryBox, title: 'Animations', page: const AnimacionesPage() ),
  _Route( icon: FontAwesomeIcons.circleNotch, title: 'Progessive Bar', page: const CircularGraphicsPage() ),
  _Route( icon: FontAwesomeIcons.pinterest, title: 'Pinterest', page: const PinterestPage() ),  
  _Route( icon: FontAwesomeIcons.mobile, title: 'Slivers', page: const SliverListPage() ),
];


class _Route{
  final IconData icon;
  final String title;
  final Widget page;

  _Route({required this.icon, required this.title, required this.page});

}