import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/tests/test_api.dart';
import 'package:foxlearn/app/presentation/tests/test_model.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';

class TestDetails extends StatefulWidget {
  final int id;

  const TestDetails({Key? key, required this.id}) : super(key: key);

  @override
  _TestDetailsState createState() => _TestDetailsState();
}

class _TestDetailsState extends State<TestDetails> {
  late Future<List<TestModel>> getFuture;
  late Map<int, Map<int, bool>> checked = {};

  @override
  void initState() {
    print("initState");
    // TODO: implement initState
    getFuture = TestsApi().getQuestion(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<TestModel>>(
            future: getFuture,
            builder: (_, snap) {
              if (snap.data == null) return LottieLoading();
              final list = snap.data;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: list!.length,
                  itemBuilder: (_, i) {
                    final current = list[i];
                    return Card(
                      elevation: 0,
                      child: Column(
                        children: [
                          Text(current.question),
                          ListView.builder(
                              itemCount: current.answers.length,
                              itemBuilder: (_, j) {
                                final currentAnswer = current.answers[j];
                                return RadioListTile(
                                  title: Text(currentAnswer.answer),
                                  value: true,
                                  groupValue: false,
                                  onChanged: (bool? value) {},
                                );
                              })
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
