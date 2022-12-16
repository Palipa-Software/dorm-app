import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_controller.dart';
import 'package:dorm_app/modules/rezervation_confirmation/rezervation_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/widgets/custom_rezervation_button.dart';

class GymRezervationController extends GetxController {
  List<String> rezervationClocks = [
    "00:00-01:00",
    "01:00-02:00",
    "02:00-03:00",
    "03:00-04:00",
    "04:00-05:00",
    "05:00-06:00",
    "06:00-07:00",
    "07:00-08:00",
    "08:00-09:00",
    "09:00-10:00",
    "10:00-11:00",
    "11:00-12:00",
    "12:00-13:00",
    "13:00-14:00",
    "14:00-15:00",
    "15:00-16:00",
    "16:00-17:00",
    "17:00-18:00",
    "18:00-19:00",
    "19:00-20:00",
    "20:00-21:00",
    "21:00-22:00",
    "22:00-23:00",
    "23:00-00:00",
  ];
  List<Widget> clocs = [
    CustomRezervationButton(
      clock: "00:00-01:00",
      onTap: () {
        RezervationConfirmationController controller =
            RezervationConfirmationController();

        Get.to(
          RezervationConfirmationScreen(),
          arguments: ["00:00-01:00", 0],
        );
      },
    ),
    CustomRezervationButton(
      clock: "01:00-02:00",
      onTap: () {
        RezervationConfirmationController controller =
            RezervationConfirmationController();

        Get.to(RezervationConfirmationScreen(), arguments: ["01:00-02:00", 1]);
      },
    ),
    CustomRezervationButton(
      clock: "02:00-03:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["02:00-03:00", 2]);
      },
    ),
    CustomRezervationButton(
      clock: "03:00-04:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["03:00-04:00", 3]);
      },
    ),
    CustomRezervationButton(
      clock: "04:00-05:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["04:00-05:00", 4]);
      },
    ),
    CustomRezervationButton(
      clock: "05:00-06:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["05:00-06:00", 5]);
      },
    ),
    CustomRezervationButton(
      clock: "06:00-07:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["06:00-07:00", 6]);
      },
    ),
    CustomRezervationButton(
      clock: "07:00-08:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["07:00-08:00", 7]);
      },
    ),
    CustomRezervationButton(
      clock: "08:00-09:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["08:00-09:00", 8]);
      },
    ),
    CustomRezervationButton(
      clock: "09:00-10:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["09:00-10:00", 9]);
      },
    ),
    CustomRezervationButton(
      clock: "10:00-11:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["10:00-11:00", 10]);
      },
    ),
    CustomRezervationButton(
      clock: "11:00-12:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["11:00-12:00", 11]);
      },
    ),
    CustomRezervationButton(
      clock: "12:00-13:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["12:00-13:00", 12]);
      },
    ),
    CustomRezervationButton(
      clock: "13:00-14:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["13:00-14:00", 13]);
      },
    ),
    CustomRezervationButton(
      clock: "14:00-15:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["14:00-15:00", 14]);
      },
    ),
    CustomRezervationButton(
      clock: "15:00-16:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["15:00-16:00", 15]);
      },
    ),
    CustomRezervationButton(
      clock: "16:00-17:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["16:00-17:00", 16]);
      },
    ),
    CustomRezervationButton(
      clock: "17:00-18:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["17:00-18:00", 17]);
      },
    ),
    CustomRezervationButton(
      clock: "18:00-19:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["18:00-19:00", 18]);
      },
    ),
    CustomRezervationButton(
      clock: "19:00-20:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["19:00-20:00", 19]);
      },
    ),
    CustomRezervationButton(
      clock: "20:00-21:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["20:00-21:00", 20]);
      },
    ),
    CustomRezervationButton(
      clock: "21:00-22:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["21:00-22:00", 21]);
      },
    ),
    CustomRezervationButton(
      clock: "22:00-23:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["22:00-23:00", 22]);
      },
    ),
    CustomRezervationButton(
      clock: "23:00-00:00",
      onTap: () {
        Get.to(RezervationConfirmationScreen(), arguments: ["23:00-00:00", 23]);
      },
    ),
  ];
}
