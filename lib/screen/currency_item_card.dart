
import 'package:currencyflutter/data/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../data/model/currency_model.dart';
import '../data/pref/my_preference.dart';



  Widget CurrenyItemCard(CurrencyModel currencyModel, void Function() calc) {


    String lang = MyPreference.getLang() ?? "uz";
    Map<String, String> translations = {
      "en": currencyModel.ccyNmEN.toString() ?? "No Data",
      "uz": currencyModel.ccyNmUZ.toString() ?? "No Data",
      "ru": currencyModel.ccyNmRU.toString() ?? "No Data",
    };
    Text diff(String dif){
      if(dif.contains("-")){
       return Text(
            currencyModel.diff ?? 'null',
            style: const TextStyle(
                color: Colors.red,
                fontSize: 17,
                fontWeight: FontWeight.w600));
      }else{
        return Text(
            "+${currencyModel.diff}" ?? 'null',
            style: const TextStyle(
                color: Colors.green,
                fontSize: 17,
                fontWeight: FontWeight.w600));
      }
    }

      return Card(
        color: Color(0xFFFFF7F9),
        child: Theme(

          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Container(
              height: 65,
              child:  Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                              translations[lang] ?? 'null',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5,),

                          diff(currencyModel.diff ?? 'null')
                        ],
                      ),
                     const SizedBox(height: 10),
                      Row(
                        children: [
                          Text("1 ${currencyModel.ccy}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                          const SizedBox(height: 3),
                          const Text(" => ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                          const SizedBox(height: 3),
                          Text(currencyModel.rate ?? 'null',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                          const SizedBox(height: 2),
                          const Text("|",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                          const SizedBox(width: 5),
                          Image.asset("assets/images/schedule.png", height: 20,width: 20,),
                          const SizedBox(width: 5),
                          Text(currencyModel.date.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            children: [
              SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    calc();
                  },
                  child: Container(
                    height: 40,
                    width: 110,
                    decoration:
                  BoxDecoration(color: Color(0xFF683396), borderRadius: BorderRadius.circular(10)),
                  child: Center(child:
                  Text(LocaleKeys.calc.tr(), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),),
                          ),
                ),
              ),
            ),
              SizedBox(height: 5,),
            ],
          ),
        ),
      );



  }

