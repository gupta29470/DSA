void main() {
  int row = 5, col = 3;

  pascalTriangle(row, col);
}

void pascalTriangle(int row, int col) {
  pascalTriangle_2(row, col);
}

// time: O(row^2)
void pascalTriangle_1(int row, int col) {
  List<List<int>> rows = [];
  if (row == 1) {
    print([
      [1]
    ]);
    return;
  }

  if (row == 2) {
    print([
      [1],
      [1, 1]
    ]);
    return;
  }

  for (int index = 0; index < row; index++) {
    rows.add([]);
  }

  rows[0] = [1];
  rows[1] = [1, 1];

  for (int index1 = 2; index1 < row; index1++) {
    List<int> currentRow = [1];
    List<int> previousRow = rows[index1 - 1];

    for (int index2 = 1; index2 < previousRow.length; index2++) {
      currentRow.add(previousRow[index2] + previousRow[index2 - 1]);
    }

    currentRow.add(1);
    rows[index1] = currentRow;
  }

  print(rows);
  print(rows[row - 1][col - 1]);
}

// time: O(row)
void pascalTriangle_2(int row, int col) {
  int rowFactorial = 1;
  int colFactorial = 1;
  int rowMinusColFactorial = row - col;

  for (int number = 2; number < row; number++) {
    rowFactorial *= number;
  }
  for (int number = 2; number < col; number++) {
    colFactorial *= number;
  }
  for (int number = 2; number < (row - col); number++) {
    rowMinusColFactorial *= number;
  }

  print(rowFactorial);
  print(colFactorial);
  print(rowMinusColFactorial);

  int result = rowFactorial ~/ (colFactorial * rowMinusColFactorial);

  print(result);
}
