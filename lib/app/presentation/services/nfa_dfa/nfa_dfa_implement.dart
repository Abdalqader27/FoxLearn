// import 'dart:collection';
//
// import 'package:flutter/material.dart';
// import 'package:foxlearn/resources/theme/colors.dart';
//
// import 'Curve.dart';
//
// class NfaToDfaImplement {
//   // form validators
//   var formKey = GlobalKey<FormState>();
//   var formKey2 = GlobalKey<FormState>();
//
//   // variables for UI and algorithm
//   double padding = 0.0;
//
//   int noOfStates = 0, noOfAlphabets = 0, newStates = 0;
//
//   /// input
//   // ignore: non_constant_identifier_names
//   int number_of_state = 0, number_of_alphabet = 0;
//
//   Color color = Colors.white;
//   String info = "", info2 = "", cinfo = "";
//
//   List<String> statesList = [], alphabetsList = [], newFinalStates = [];
//   bool visible = false, visible2 = false;
//   List<List<String>> inputTable = [];
//   Map<String, String> closureMap = {};
//
//   // variable for animation
//   List<List<String>> outputTable = [];
//   List<String> outputStates = [], outputAlphabets = [];
//   List<Widget> stack = [];
//
//   ///done
//   nfaInfo() {
//     /// Number of alpha bet
//     info = "Q = { ";
//     alphabetsList.add("");
//     for (int i = 0; i < noOfStates; ++i) {
//       /// convert int from int  to A - B - C
//       info += String.fromCharCode(i + 65);
//       statesList.add(String.fromCharCode(i + 65));
//
//       if (i != noOfStates - 1) info += ", ";
//     }
//     info += " }\nΣ = { ";
//     for (int i = 0; i < noOfAlphabets; ++i) {
//       info += String.fromCharCode(i + 97);
//       alphabetsList.add(String.fromCharCode(i + 97));
//       info += ", ";
//     }
//     alphabetsList.add("ϵ");
//     info += "eps }\nq0 = { A }\nF = { ";
//     info += String.fromCharCode(65 + noOfStates - 1);
//     info += " }";
//   }
//
//   // function to get the info of DFA
//   dfaInfo() {
//     outputStates = [];
//     outputAlphabets = [];
//     info2 = "Q = { ";
//     for (int i = 0; i < newStates; ++i) {
//       info2 += String.fromCharCode(i + 65);
//       statesList.add(String.fromCharCode(i + 65));
//       outputStates.add(String.fromCharCode(i + 65));
//       if (i != newStates - 1) info2 += ", ";
//     }
//     info2 += " }\nΣ = { ";
//     for (int i = 0; i < noOfAlphabets; ++i) {
//       info2 += String.fromCharCode(i + 97);
//       alphabetsList.add(String.fromCharCode(i + 97));
//       outputAlphabets.add(String.fromCharCode(i + 97));
//       if (i != noOfAlphabets - 1) info2 += ", ";
//     }
//     info2 += " }\nq0 = { A }\nF = { ";
//     for (int i = 0; i < newFinalStates.length; ++i) {
//       info2 += newFinalStates[i];
//       if (i != newFinalStates.length - 1) info2 += ", ";
//     }
//     info2 += " }";
//   }
//
//   // function to get the info of Closures
//   closureInfo() {
//     cinfo = "";
//     int temp = 0;
//     closureMap.forEach((key, value) {
//       cinfo += "eps-Closure for ";
//       cinfo += key;
//       cinfo += " is ";
//       cinfo += value;
//       cinfo += "\n[ New assigned state: ";
//       cinfo += String.fromCharCode(temp + 65);
//       cinfo += " ]\n";
//       ++temp;
//     });
//   }
//
//   // function to convert NFA to DFA
//   void solve() {
//     // list for states
//     List<String> states = [];
//     // list for alphabets
//     List<String> alphabets = [];
//     // Setting the set of States
//     for (int i = 0; i < noOfStates; ++i) states.add(String.fromCharCode(i + 65));
//     // Setting the set of Alphabets
//     for (int i = 0; i < noOfAlphabets; ++i) alphabets.add(String.fromCharCode(i + 97));
//     alphabets.add("eps");
//     // map for State Transition Table
//     Map<String, String> stateTransitionTable = {};
//     // filling the State Transition Table
//     for (int i = 0; i < noOfStates; ++i) {
//       for (int j = 0; j < noOfAlphabets + 1; ++j) {
//         stateTransitionTable[states[i] + alphabets[j]] = inputTable[i][j];
//         //print(stateTransitionTable[states[i] + alphabets[j]]);
//         print("-" + inputTable[i][j] + "-");
//       }
//       print("\n");
//     }
//     // map to maintain the closure table
//     Map<String, String> closureTable = {};
//     // map to maintain the new state transition table
//     Map<String, String> newTable = {};
//     // sets for new states coming
//     Set<String> newStatesSet = {};
//     // sets for list of all the closures
//     Set<String> allClosures = {};
//     // queue for the algorithm for maintaining the new coming state in execution
//     Queue<String> newStatesQueue = new Queue<String>();
//     // algorithm starts
//     newStatesSet.add(states[0]);
//     newStatesQueue.add(states[0]);
//     while (newStatesQueue.isNotEmpty) {
//       // set to store the unique list of curr state in the algo for single time insertion in queue
//       Set<String> currStates = {};
//       // queue for the algorithm for maintaining the curr state in execution
//       Queue<String> currQueue = new Queue<String>();
//       // geting the closure for current state
//       String currStateIn = newStatesQueue.first;
//       newStatesQueue.removeFirst();
//       for (int i = 0; i < currStateIn.length; ++i) {
//         String temp = "";
//         temp += currStateIn[i];
//         currQueue.add(temp);
//       }
//       while (currQueue.isNotEmpty) {
//         String currState = currQueue.first;
//         currQueue.removeFirst();
//         currStates.add(currState);
//         if (stateTransitionTable[currState + alphabets[noOfAlphabets]] != "-") {
//           String? temp = stateTransitionTable[currState + alphabets[noOfAlphabets]];
//           if (temp == null) temp = "";
//           for (int i = 0; i < temp.length; ++i) {
//             String str = "";
//             str += temp[i];
//             if (!currStates.contains(str)) {
//               currStates.add(str);
//               currQueue.add(str);
//             }
//           }
//         }
//       }
//       String closure = "";
//       for (var it in currStates) closure += it;
//       closureTable[currStateIn] = closure;
//       closureMap[currStateIn] = closure;
//       allClosures.add(closure);
//       // for the curr state finding the transitions for all the alphabets
//       for (int i = 0; i < noOfAlphabets; ++i) {
//         Set<String> currClosure = {};
//         for (int j = 0; j < closure.length; ++j) {
//           String temp = "";
//           temp += closure[j];
//           if (stateTransitionTable[temp + alphabets[i]] != "-") {
//             String temp2 = stateTransitionTable[temp + alphabets[i]];
//             if (temp2 == null) temp2 = "";
//             for (int k = 0; k < temp2.length; ++k) {
//               String str = "";
//               str += temp2[k];
//               currClosure.add(str);
//             }
//           }
//         }
//         String newCurrState = "";
//         for (var it in currClosure) newCurrState += it;
//         if (newCurrState != "" && !newStatesSet.contains(newCurrState)) {
//           newStatesSet.add(newCurrState);
//           newStatesQueue.add(newCurrState);
//         }
//         if (newCurrState == "")
//           newTable[closure + alphabets[i]] = "-";
//         else
//           newTable[closure + alphabets[i]] = newCurrState;
//       }
//     }
//     Map<String, String> newStatesMap = {};
//     int tmp = 0;
//     for (var it in allClosures) {
//       String temp = "";
//       temp += String.fromCharCode(tmp + 65);
//       ++tmp;
//       newStatesMap[it] = temp;
//       for (int i = 0; i < it.length; ++i) {
//         String s = "";
//         s += it[i];
//         if (s == states[noOfStates - 1]) {
//           newFinalStates.add(temp);
//           break;
//         }
//       }
//     }
//     outputTable = [];
//     for (int i = 0; i < allClosures.length; ++i) {
//       List<String> ls = [];
//       for (int j = 0; j < noOfAlphabets; ++j) ls.add("-");
//       outputTable.add(ls);
//     }
//     // storing back the states
//     for (var it in allClosures) {
//       String ?newState = newStatesMap[it];
//       ++newStates;
//       for (int j = 0; j < noOfAlphabets; ++j) {
//         outputTable[newState!.codeUnitAt(0) - 65][j] =
//             newStatesMap![closureTable[newTable[it + alphabets[j]]]];
//       }
//     }
//     alphabetsList.remove("eps");
//     visible2 = true;
//   }
//
//   // function to display DFA related info
//   Widget dfaDisplay() {
//     return Column(
//       children: [
//         Visibility(
//           visible: visible2,
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
//                 child: Text(
//                   'Closures',
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
//                     cinfo,
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
//                 child: Text(
//                   'Details for DFA',
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
//                     info2,
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
//                   'State Transition Table for DFA',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topCenter,
//                 padding: EdgeInsets.symmetric(vertical: 25.0),
//                 child: DataTable(showBottomBorder: false, columns: [
//                   DataColumn(
//                     label: Text(""),
//                   ),
//                   for (int i = 0; i < noOfAlphabets; ++i)
//                     DataColumn(
//                       label: Text(String.fromCharCode(i + 97)),
//                     ),
//                 ], rows: [
//                   for (int j = 0; j < newStates; ++j)
//                     DataRow(
//                       cells: [
//                         DataCell(Text(String.fromCharCode(j + 65))),
//                         for (int i = 0; i < noOfAlphabets; ++i)
//                           DataCell(Text((outputTable[j][i] != null) ? outputTable[j][i] : "-")),
//                       ],
//                     )
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//