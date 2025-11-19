import 'package:flutter/material.dart';
import 'package:petloveadoption/models/Pet.dart';
import 'package:petloveadoption/views/tutor_page.dart';
import 'views/details_page.dart';
import 'views/home_page.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const detailsPage = '/detailsPage';
  static const tutorPage = '/tutorPage';

  Map<String, WidgetBuilder> define() {
    return{
      homePage: (BuildContext context) => HomePage(),
      detailsPage: (BuildContext context) {
        final Pet pet =
            ModalRoute.of(context)!.settings.arguments as Pet;
        return DetailsPage(pet: pet);

      },
      tutorPage: (BuildContext context) => TutorPage(),
    };
  }
}