// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'accordion.dart';
// import 'nfa_dfa_implement.dart';
//
// class NFAtoDFASolver extends StatefulWidget {
//   @override
//   _NFAtoDFASolverState createState() => _NFAtoDFASolverState();
// }
//
// class _NFAtoDFASolverState extends State<NFAtoDFASolver> with NfaToDfaImplement {
//   // function to get the info of NFA
//   // function to display NFA related info
//   Widget nfaDisplay() {
//     return Column(
//       children: [
//         Visibility(
//           visible: visible,
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
//                 child: Text(
//                   'Details for eps-NFA',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1.0),
//                 child: Container(
//                   decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
//                   margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                   padding: EdgeInsets.symmetric(vertical: padding, horizontal: 20.0),
//                   child: Text(
//                     info,
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 1.0),
//                 child: Text(
//                   'State Transition Table for eps-NFA',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topCenter,
//                 padding: EdgeInsets.symmetric(vertical: 25.0),
//                 child: Form(
//                   key: formKey2,
//                   child: DataTable(
//                     showBottomBorder: false,
//                     columns: [
//                       DataColumn(label: Text("")),
//                       for (int i = 0; i < noOfAlphabets; ++i)
//                         DataColumn(
//                           label: Text(String.fromCharCode(i + 97)),
//                         ),
//                       DataColumn(label: Text("eps")),
//                     ],
//                     rows: [
//                       for (int j = 0; j < noOfStates; ++j)
//                         DataRow(
//                           cells: [
//                             DataCell(Text(String.fromCharCode(j + 65))),
//                             for (int i = 0; i < noOfAlphabets + 1; ++i)
//                               DataCell(
//                                 TextFormField(
//                                   onChanged: (val) {
//                                     setState(() {
//                                       int ii = i, jj = j;
//                                       inputTable[jj][ii] = val;
//                                       if (val == "") inputTable[jj][ii] = "-";
//                                       print(inputTable);
//                                     });
//                                   },
//                                   validator: (String val) {
//                                     if (val == "") return ".";
//                                     return null;
//                                   },
//                                   decoration: InputDecoration(
//                                     labelStyle: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.black,
//                                     ),
//                                     border: UnderlineInputBorder(),
//                                     fillColor: Colors.white,
//                                     filled: false,
//                                   ),
//                                   keyboardType: TextInputType.text,
//                                   obscureText: false,
//                                   maxLines: 1,
//                                 ),
//                               ),
//                           ],
//                         )
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
//                 child: ButtonBar(
//                   alignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       child: Text(
//                         'Convert to DFA',
//                         style: TextStyle(color: AppColors.Black15),
//                       ),
//                       style: TextButton.styleFrom(
//                         elevation: 1,
//                         backgroundColor: AppColors.primaryColor,
//                         shape: BeveledRectangleBorder(
//                             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
//                             side: BorderSide(color: AppColors.grey.withOpacity(.05))),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           newStates = 0;
//                           info2 = "";
//                           cinfo = "";
//                           newFinalStates = [];
//                           closureMap = {};
//                           stack = [];
//                           solve();
//                           dfaInfo();
//                           closureInfo();
//                         });
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   // function to display input fields
//   Widget inputsDisplay() {
//     return Column(
//       children: [
//         Form(
//           key: formKey,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 4.0),
//                 child: Card(
//                   elevation: 0,
//                   shape: BeveledRectangleBorder(
//                     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
//                     side: BorderSide(color: AppColors.grey.withOpacity(.05)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       onChanged: (val) {
//                         setState(() {
//                           number_of_state = int.parse(val);
//                         });
//                       },
//                       validator: (String states) {
//                         for (int i = 0; i < states.length; ++i)
//                           if (!(states.codeUnitAt(i) > 48 && states.codeUnitAt(i) < 59))
//                             return "Enter only integer values";
//                         if (states == "") return "Enter an integer value";
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: "Enter Number of States",
//                         labelText: "Number of States",
//                         labelStyle: TextStyle(
//                           fontSize: 12,
//                           color: Colors.black,
//                         ),
//                         border: InputBorder.none,
//                         fillColor: Colors.white,
//                         filled: true,
//                         icon: Icon(Mdi.alphabeticalVariant),
//                       ),
//                       keyboardType: TextInputType.number,
//                       obscureText: false,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 4.0),
//                 child: Card(
//                   elevation: 0,
//                   shape: BeveledRectangleBorder(
//                     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
//                     side: BorderSide(color: AppColors.grey.withOpacity(.05)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       onChanged: (val) {
//                         setState(() {
//                           number_of_alphabet = int.parse(val);
//                         });
//                       },
//                       validator: (String alphabets) {
//                         for (int i = 0; i < alphabets.length; ++i)
//                           if (!(alphabets.codeUnitAt(i) > 48 && alphabets.codeUnitAt(i) < 59))
//                             return "Enter only integer values";
//                         if (alphabets == "") return "Enter an integer value";
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: "Enter Number of Alphabets",
//                         labelText: "Number of Alphabets",
//                         labelStyle: TextStyle(
//                           fontSize: 12,
//                           color: Colors.black,
//                         ),
//                         border: InputBorder.none,
//                         fillColor: Colors.white,
//                         filled: false,
//                         icon: Icon(Mdi.alphabetical),
//                       ),
//                       keyboardType: TextInputType.number,
//                       obscureText: false,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
//                 child: ButtonBar(
//                   alignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       child: Text(
//                         'Next',
//                         style: TextStyle(color: AppColors.Black15),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           if (formKey.currentState.validate()) {
//                             padding = 10.0;
//                             visible = true;
//                             visible2 = false;
//                             color = Colors.grey[100].withOpacity(.8);
//                             noOfAlphabets = number_of_alphabet;
//                             noOfStates = number_of_state;
//                             nfaInfo();
//                             for (int i = 0; i < noOfStates; ++i) {
//                               List<String> temp = [];
//                               for (int j = 0; j < noOfAlphabets + 1; ++j) temp.add("-");
//                               inputTable.add(temp);
//                             }
//                           }
//                         });
//                       },
//                       style: TextButton.styleFrom(
//                         elevation: 1,
//                         backgroundColor: AppColors.primaryColor,
//                         shape: BeveledRectangleBorder(
//                             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
//                             side: BorderSide(color: AppColors.grey.withOpacity(.05))),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackground,
//       appBar: AppBar(
//         elevation: 0,
//         shape: BeveledRectangleBorder(
//           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
//           side: BorderSide(color: AppColors.grey.withOpacity(.05)),
//         ),
//         title: Text(
//           'eps-NFA to DFA Converter',
//           style: TextStyle(color: AppColors.Black15),
//         ),
//         backgroundColor: AppColors.primaryColor,
//         actions: [
//           IconButton(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             icon: Icon(Icons.refresh),
//             hoverColor: Colors.blue[400],
//             tooltip: 'Refresh Converter',
//             onPressed: () {
//               Phoenix.rebirth(context);
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ExpandableTheme(
//               data: const ExpandableThemeData(
//                 iconColor: Colors.blue,
//                 useInkWell: true,
//               ),
//               child: Column(
//                 children: <Widget>[
//                   inputsDisplay(),
//                   visible ? Accordion(nfaDisplay(), "eps-NFA Information") : Container(),
//                   visible2 ? Accordion(dfaDisplay(), "DFA Information") : Container(),
//                   visible2
//                       ? Accordion(outputTable.length == 0 ? Container() : draw(), "DFA Diagram")
//                       : Container(),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
