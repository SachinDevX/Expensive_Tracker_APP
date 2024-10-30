import 'package:expensive_track/bar%20graph/individual_bar.dart';

class BarData{
  final double sunamount;
  final double monamount;
  final double tuesamount;
  final double wedamount;
  final double thursamount;
  final double friamount;
  final double satamount;
  BarData({


    required this.sunamount,
    required this.monamount,
    required this.tuesamount,
    required this.wedamount,
    required this.thursamount,
    required this.friamount,
    required this.satamount,


});
  List<individual_bar> barData = [];

  //initialize bar data
  void InitailzelBardata(){
    barData = [
      //sun
      individual_bar(x: 0, y: sunamount),
      //mon
      individual_bar(x: 0, y: monamount),
      //tues
      individual_bar(x: 0, y: tuesamount),
      //wed
      individual_bar(x: 0, y: wedamount),
      //thur
      individual_bar(x: 0, y: thursamount),
      //fri
      individual_bar(x: 0, y: friamount),
      //sat
      individual_bar(x: 0, y: satamount),



    ];
  }

}
