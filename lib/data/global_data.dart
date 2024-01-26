import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_journal_v2/models/workout/workout.dart';
import 'package:workout_journal_v2/theme/colors.dart';
import 'package:workout_journal_v2/theme/text_styles.dart';

class Constants {
  // USER INFO
  static late String name;

  // WORKOUT STORAGE
  static late Box workoutBox;
  static List<Workout> workouts = [];

  // TEMPLATE STORAGE
  static List<Workout> templates = [
    Workout(
      id: 'blah',
      title: 'Template 1',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
    Workout(
      id: 'blah1',
      title: 'Template 2',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
    Workout(
      id: 'blah2',
      title: 'Template 3',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
    Workout(
      id: 'blah3',
      title: 'Template 4',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
    Workout(
      id: 'blah4',
      title: 'Template 5',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
    Workout(
      id: 'blah5',
      title: 'Template 6',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
    Workout(
      id: 'blah6',
      title: 'Template 7',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
    Workout(
      id: 'blah7',
      title: 'Template 8',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
    Workout(
      id: 'blah8',
      title: 'Template 9',
      date: DateTime.now(),
      img: 'arms.png',
      exercises: [],
    ),
  ];

  // METHODS
  static void setList(List<Workout> list) {
    workouts = list;
  }

  static void setName(String n) {
    name = Methods.formatName(n);
  }
}

class Methods {
  static String formatName(String name) {
    if (name.isEmpty) {
      return '';
    }

    List<String> names = name.split(' ');

    // Handle cases where there might be extra spaces in the input
    names = names.where((element) => element.isNotEmpty).toList();

    List<String> tempList = [];

    for (final name in names) {
      if (name.length > 1) {
        tempList
            .add('${name[0].toUpperCase()}${name.substring(1).toLowerCase()}');
      } else {
        tempList.add(name.toUpperCase());
      }
    }

    return tempList.join(' ');
  }

  static void showToastMessage(
      BuildContext context, Color color, IconData icon, String title) {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: AppColors.white,
          ),
          const SizedBox(width: 12),
          TextHeeboMedium(text: title, size: 14),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
      gravity: ToastGravity.BOTTOM,
    );
  }
}

class Weights {
  static const reg = FontWeight.w300;
  static const medium = FontWeight.w400;
  static const bold = FontWeight.w700;
}
