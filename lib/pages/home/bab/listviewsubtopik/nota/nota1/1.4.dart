import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class Notes1point4 extends StatefulWidget {
  final String path;
  const Notes1point4({Key key, this.path}) : super(key: key);

  @override
  _Notes1point4State createState() => _Notes1point4State();
}

class _Notes1point4State extends State<Notes1point4> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (c) {
              print(c);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {
                
              });
            },
            onPageError: (page, c) {},
            ),
            !pdfReady
            ? Center(
              child: CircularProgressIndicator(),
            )
            : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0 ? FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: Text("Go to ${_currentPage - 1}"),
            onPressed: (){
              _currentPage -=1;
              _pdfViewController.setPage(_currentPage);
            },
            )
            : Offstage(),
            _currentPage + 1 < _totalPages ? FloatingActionButton.extended(
              backgroundColor: Colors.green,
              label: Text("Go to ${_currentPage + 1}"),
              onPressed: (){
                _currentPage += 1;
                _pdfViewController.setPage(_currentPage);
              },
              )
              : Offstage(),
        ],
      ),
    );
  }
}
