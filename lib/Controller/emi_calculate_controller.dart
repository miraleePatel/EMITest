import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/emi_model.dart';

class EMICalculateController extends GetxController{


  List<TitleModel> titleList = [
    TitleModel(title:"EMI" ),
    TitleModel(title: "Loan"),
    TitleModel(title:"Interest" ),
    TitleModel(title:"Period" )

  ].obs;

  RxInt currentIndex = 0.obs;
  TextEditingController loanController = TextEditingController();
  TextEditingController intrestController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxInt loan = 10.obs;
  RxDouble loanValue = RxDouble(40.0);

  double monthlyEMI = 0.0;
  double totalPayment = 0.0;


}