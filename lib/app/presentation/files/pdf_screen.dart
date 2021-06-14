import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/files/files_model.dart';
import 'package:foxlearn/common/api_tools/api_routes.dart';
import 'package:foxlearn/common/widgets/app_bar.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  final FilesModel file;

  const PdfScreen({Key? key, required this.file}) : super(key: key);

  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppBarUser(
            color: AppColors.LIGHT_Red,
            text: widget.file.fileName,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Expanded(
            child: SfPdfViewer.network(
              ApiRoutes.BASE+widget.file.url,
              key: _pdfViewerKey,
            ),
          ),
        ],
      ),
    ));
  }
}
