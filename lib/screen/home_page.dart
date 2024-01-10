import 'package:currencyflutter/bloc/main_bloc.dart';
import 'package:currencyflutter/data/lang/locale_keys.g.dart';
import 'package:currencyflutter/screen/InputText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/pref/my_preference.dart';
import '../data/status.dart';
import 'currency_item_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = MainBloc();

  bool changer = true;
  double mp = 0.0;
  var _controllerFirst = TextEditingController();

  var _controllerSecond = TextEditingController();

  @override
  void initState() {
    _controllerFirst.addListener(() {
      double v1 = double.tryParse(_controllerFirst.text) ?? 0.0;

      if (changer) {
        double result = v1 * mp;
        _controllerSecond.text = result.toString();
      } else {
        double result = v1 / mp;
        _controllerSecond.text = result.toString();
      }
    });

    bloc.add(InitialCurrencyEvent());

    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    bloc.add(InitialCurrencyEvent());
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.title.tr(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Color(0xFF68299B),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          actions: [
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      builder: (context) => Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: Color(0xffFFFFFF)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                    onTap: () async {
                                      await context
                                          .setLocale(const Locale("uz"));
                                      MyPreference.setLang("uz");
                                      Navigator.pop(context);
                                    },
                                    child: const Text("O'zbekcha",
                                        style: TextStyle(
                                          color: Color(0xFF673bb7),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ))),
                                const SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                    onTap: () async {
                                      await context
                                          .setLocale(const Locale("en"));
                                      MyPreference.setLang("en");
                                      Navigator.pop(context);
                                    },
                                    child: const Text("English",
                                        style: TextStyle(
                                          color: Color(0xFF673bb7),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ))),
                                const SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                    onTap: () async {
                                      await context
                                          .setLocale(const Locale("ru"));
                                      MyPreference.setLang("ru");
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Русский",
                                        style: TextStyle(
                                          color: Color(0xFF673bb7),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ))),
                                const SizedBox(
                                  height: 6,
                                ),
                              ],
                            ),
                          ));
                },
                child: Icon(Icons.language, color: Colors.white)),
            SizedBox(width: 15),
          ],
        ),
        body: SafeArea(
          child: Container(
            child: BlocConsumer<MainBloc, MainState>(
              listener: (context, state) {},
              builder: (ctx, state) {
                if (state.status == Status.ERROR) {
                  return const Center(
                    child: Text(
                      "Error",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  );
                } else if (state.status == Status.LOADING) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                } else if (state.status == Status.SUCCESS) {

                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.865,
                        child: ListView.builder(
                          itemCount: state.list?.length,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  CurrenyItemCard(state.list!.elementAt(i), () {
                                mp = double.parse(
                                    state.list![i].rate.toString());
                                _controllerFirst.text = '';
                                var lbtext1= state.list!
                                    .elementAt(i)
                                    .ccyNmUZ!;
                                var lbtext2= 'UZ';
                                showModalBottomSheet(
                                    context: context,
                                    isDismissible: true,
                                    isScrollControlled: true,
                                    builder: (context) => StatefulBuilder(
                                       builder: (BuildContext context, setState){
                                      return Padding(
                                            padding:
                                                MediaQuery.of(context).viewInsets,
                                            child: Container(
                                              height: 280,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xFFFFFFFF)),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 15),
                                                  Text(
                                                    state.list!
                                                        .elementAt(i)
                                                        .ccyNmUZ!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0,
                                                              right: 15,
                                                              bottom: 10),
                                                      child: InputText(
                                                          changer
                                                              ? "UZS"
                                                              : state.list![i].ccy
                                                                  .toString(),
                                                          _controllerFirst,
                                                          20,
                                                          true)),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0,
                                                              right: 15),
                                                      child: InputText(
                                                          changer
                                                              ? state.list![i].ccy
                                                                  .toString()
                                                              : "UZS",
                                                          _controllerSecond,
                                                          20,
                                                          false)),
                                                   Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 15, top: 15),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: InkWell(
                                                        onTap: (){
                                                          setState((){
                                                            _controllerFirst.text = "";
                                                            changer = !changer;
                                                          });

                                                        },
                                                        child: Icon(
                                                          Icons.refresh_sharp,
                                                          color: Colors.purple,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );}
                                    ));
                              }),
                            );
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("Xato"),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
