import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScannerView extends StatefulWidget {
  final bool? isKeyboardClosed;
  final ValueChanged<String>? onChange;

  ScannerView({Key? key, this.isKeyboardClosed, this.onChange})
      : super(key: key);

  @override
  _ScannerViewState createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (!widget.isKeyboardClosed!) return;
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        replacement: Container(),
        visible: widget.isKeyboardClosed!,
        child: Container(
          height: 35.0.h,
          width: 35.0.h,
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: QRView(
                    key: qrKey,
                    overlay: QrScannerOverlayShape(
                      borderRadius: 15,
                      borderWidth: 4,
                      cutOutSize: 150.0.sp,
                      borderColor: AppColors.ACCENT,
                    ),
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        widget.onChange!(scanData.code);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
