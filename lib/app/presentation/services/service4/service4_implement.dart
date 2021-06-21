import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/common/widgets/multi_select_dialog_Item.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:mdi/mdi.dart';
import 'package:tuple/tuple.dart';

class Service4Implement {
  List<Widget> filedStates = [];
  List<Widget> fieldAlphabet = [];
  List<TextEditingController> statesController = [];
  List<TextEditingController> alphabetController = [];
  List<String> statesList = [], alphabetsList = [];
  List<List<String>> inputTable = [];
  List<List<Tuple2<Set<int>, TextEditingController>>> tableController = [[]];
  String info = "";
  Set<int> first = {};
  Set<int> end = {};
  Set<String> endText = {};
  Set<String> firstText = {};

  void selectEndState(BuildContext context, setState) async {
    final items = List<MultiSelectDialogItem<int>>.generate(
        statesController.length,
        (index) => MultiSelectDialogItem(index, statesController[index].text));
    first = (await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          initialSelectedValues: first,
        );
      },
    ))!;
    endText.clear();
    first.forEach((element) {
      endText.add(statesController[element].text);
    });
    nfaInfo();
    setState(() {});
  }

  void selectFirstState(BuildContext context, setState) async {
    final items = List<MultiSelectDialogItem<int>>.generate(
        statesController.length,
        (index) => MultiSelectDialogItem(
              index,
              statesController[index].text,
            ));

    end = (await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          isSingle: true,
          items: items,
          initialSelectedValues: end,
        );
      },
    ))!;
    firstText.clear();
    end.forEach((element) {
      firstText.add(statesController[element].text);
    });
    nfaInfo();

    setState(() {});
  }

  void _setAutomateValues(setState,
      {required BuildContext context, required int i, required int j}) async {
    final items = List<MultiSelectDialogItem<int>>.generate(
        statesController.length,
        (index) => MultiSelectDialogItem(index, statesController[index].text));
    Set<int> temp = (await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          isSingle: true,
        );
      },
    ))!;
    List<String> text = [];
    temp.forEach((element) {
      text.add(statesController[element].text);
    });
    TextEditingController controller = tableController[j][i].item2;
    controller.text = text.toSet().toString();
    tableController[j][i] = Tuple2(temp, controller);
    nfaInfo();

    setState(() {});

  }

  Widget transitFun(context, setState) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              child: ListTile(
                title: Text(
                  'تابع الانتقال',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: AbsorbPointer(
                  absorbing: false,
                  child: DataTable(
                    onSelectAll: null,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.kLightGrey)),
                    showBottomBorder: false,
                    columns: [
                      DataColumn(label: Icon(Mdi.stateMachine)),
                      for (int i = 0; i < alphabetController.length; ++i)
                        DataColumn(
                          label: Text(alphabetController[i].text),
                        ),
                    ],
                    rows: [
                      for (int j = 0; j < statesController.length; ++j)
                        DataRow(
                          cells: [
                            DataCell(Text(statesController[j].text)),
                            for (int i = 0; i < alphabetController.length; ++i)
                              DataCell(
                                TextFormField(
                                  readOnly: true,
                                  controller: tableController[j][i].item2,
                                  onTap: () {
                                    print("i= " + i.toString());
                                    print("j= " + j.toString());
                                    _setAutomateValues(setState,
                                        context: context, j: j, i: i);
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      print("col=" + i.toString());
                                      print("row=" + j.toString());
                                      int ii = i, jj = j;
                                      inputTable[jj][ii] = val;
                                      if (val == "") inputTable[jj][ii] = "-";
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    border: UnderlineInputBorder(),
                                    fillColor: Colors.white,
                                    filled: false,
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  maxLines: 1,
                                ),
                              ),
                          ],
                          selected: false,
                          onSelectChanged: null,
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget theQuintuple() {
    return Card(
      elevation: 0,
      color: AppColors.WHITE.withOpacity(.8),
      shape: AppStyles.cardStyle4,
      child: Column(
        children: [
          Container(
            child: ListTile(
              title: Text(
                'الخماسية',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'إن الخماسية للأتومات المنتهي الحتمي  هي :',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.kLightGrey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text(
                info,
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                  wordSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void nfaInfo() {
    if (statesController.isNotEmpty && alphabetController.isNotEmpty) {
      info = "";
      alphabetsList.clear();
      info = "Q = { ";
      alphabetsList.add("");
      for (int i = 0; i < statesController.length; ++i) {
        /// convert int from int  to A - B - C
        info += statesController[i].text;
        statesList.add(statesController[i].text);

        if (i != statesController.length - 1) info += ", ";
      }
      info += " }\nΣ = { ";
      for (int i = 0; i < alphabetController.length; ++i) {
        info += alphabetController[i].text;
        alphabetsList.add(alphabetController[i].text);
        if (i != alphabetController.length - 1)
          info += ", ";
        else {
          info += "}\n";
        }
      }

      info += "q0 = {${statesController[0].text} }\nF = { ";
      info += statesController[statesController.length - 1].text;
      info += " }";
    }
  }

  void addRows(setState) {
    setState(() {
      tableController.add([]);
      inputTable.add([]);

      for (int j = 0; j < alphabetController.length; ++j) {
        tableController[statesController.length - 1]
            .add(Tuple2({}, TextEditingController()));
        inputTable[statesController.length - 1].add("-");
      }
      print("textEdition" + inputTable.toString());
      nfaInfo();
    });
  }

  void addColumn(setState) {
    setState(() {
      for (int j = 0; j < statesController.length; ++j) {
        tableController[j].add(Tuple2({}, TextEditingController()));
        inputTable[j].add("-");
      }
      print("textEdition" + inputTable.toString());
      nfaInfo();
    });
  }
}
