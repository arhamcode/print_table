String tabulate(List<List<String>> models, List<String> header) {
  var retString = '';
  var cols = header.length;
  var colLength = List<int>.filled(cols, 0);
  if (models.any((model) => model.length != cols)) {
    throw Exception('Column\'s no. of each model does not match.');
  }

  //preparing colLength.
  for (var i = 0; i < cols; i++) {
    var _chunk = <String>[];
    _chunk.add(header[i]);
    for (var model in models) {
      _chunk.add(model[i]);
    }
    colLength[i] = ([for (var c in _chunk) c.length]..sort()).last;
  }
  // here we got prepared colLength.

  String fillSpace(int maxSpace, String text) {
    return text.padLeft(maxSpace) + ' | ';
  }

  void addRow(List<String> model, List<List<String>> row) {
    var l = <String>[];
    for (var i = 0; i < cols; i++) {
      var max = colLength[i];
      l.add(fillSpace(max, model[i]));
    }
    row.add(l);
  }

  var rowList = <List<String>>[];
  addRow(header, rowList);
  var topBar = List<String>.generate(cols, (i) => '-' * colLength[i]);
  addRow(topBar, rowList);
  models.forEach((model) => addRow(model, rowList));
  rowList.forEach((row) {
    var rowText = row.join();
    rowText = rowText.substring(0, rowText.length - 2);
    retString += rowText + '\n';
  });

  return retString;
}
