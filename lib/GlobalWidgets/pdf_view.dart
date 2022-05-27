import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

import '../constants.dart';

class PdfView extends StatefulWidget {
  final String pdfUrl;

  PdfView(this.pdfUrl);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  PDFDocument _pdf;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  void _loadPdf() async {
    setState(() {
      _isLoading = true;
    });
    final PDFDocument pdf = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {
      _pdf = pdf;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: _pdf,
              showIndicator: true,
              lazyLoad: false,
            ),
    );
  }
}
