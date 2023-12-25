import 'dart:io';

void main() {
  List<List<int>> matrix = [
    [5, 1, 9, 11],
    [2, 4, 8, 10],
    [13, 3, 6, 7],
  ];

  spiral(matrix);
}

void spiral(List<List<int>> matrix) {
  spiral_1(matrix);
}

void spiral_1(List<List<int>> matrix) {
  int rowIndex = 0, colIndex = 0;
  int rowLen = matrix.length - 1, colLen = matrix[0].length - 1;

  while (rowIndex <= rowLen && colIndex <= colLen) {
    for (int index = colIndex; index <= colLen; index++) {
      stdout.write("${matrix[rowIndex][index]} ");
    }
    rowIndex++;

    for (int index = rowIndex; index <= rowLen; index++) {
      stdout.write("${matrix[index][colLen]} ");
    }
    colLen--;

    // To check if row is already traversed or not
    if (rowIndex <= rowLen) {
      for (int index = colLen; index >= colIndex; index--) {
        stdout.write("${matrix[rowLen][index]} ");
      }
      rowLen--;
    }

    // To check if col is already traversed or not
    if (colIndex <= colLen) {
      for (int index = rowLen; index >= rowIndex; index--) {
        stdout.write("${matrix[index][colIndex]} ");
      }
      colIndex++;
    }
  }

  stdout.writeln();
}
