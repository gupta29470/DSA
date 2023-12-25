void main() {
  List<List<int>> matrix = [
    [1, 2, 3, 4],
    [5, 0, 7, 8],
    [9, 10, 11, 12]
  ];

  setZero(matrix);
}

void setZero(List<List<int>> matrix) {
  setZero_3(matrix);
}

// works if matrix will always contains positive elements
// Time: O(n^3)
void setZero_1(List<List<int>> matrix) {
  for (int index1 = 0; index1 < matrix.length; index1++) {
    for (int index2 = 0; index2 < matrix[0].length; index2++) {
      if (matrix[index1][index2] == 0) {
        int index = index1 - 1;
        // up
        while (index >= 0) {
          matrix[index][index2] = -1;
          index--;
        }

        index = index1 + 1;
        // down
        while (index < matrix.length) {
          matrix[index][index2] = -1;
          index++;
        }

        index = index2 - 1;
        //left
        while (index >= 0) {
          matrix[index1][index] = -1;
          index--;
        }

        index = index2 + 1;
        // right
        while (index < matrix[0].length) {
          matrix[index1][index] = -1;
          index++;
        }
      }
    }
  }

  for (int index1 = 0; index1 < matrix.length; index1++) {
    for (int index2 = 0; index2 < matrix[0].length; index2++) {
      if (matrix[index1][index2] == -1) {
        matrix[index1][index2] = 0;
      }
    }
  }

  print(matrix);
}

void setZero_2(List<List<int>> matrix) {
  List<int> rows = [];
  List<int> columns = [];

  for (int index1 = 0; index1 < matrix.length; index1++) {
    for (int index2 = 0; index2 < matrix[0].length; index2++) {
      if (matrix[index1][index2] == 0) {
        rows.add(index1);
        columns.add(index2);
      }
    }
  }

  for (int index1 = 0; index1 < matrix.length; index1++) {
    for (int index2 = 0; index2 < matrix[0].length; index2++) {
      if (rows.contains(index1) || columns.contains(index2)) {
        matrix[index1][index2] = 0;
      }
    }
  }

  print(matrix);
}

void setZero_3(List<List<int>> matrix) {
  bool firstRowHasZero = false, firstColHasZero = false;

  for (int index = 0; index < matrix[0].length; index++) {
    if (matrix[0][index] == 0) {
      firstRowHasZero = true;
    }
  }

  for (int index = 0; index < matrix.length; index++) {
    if (matrix[index][0] == 0) {
      firstColHasZero = true;
    }
  }

  for (int index1 = 1; index1 < matrix.length; index1++) {
    for (int index2 = 1; index2 < matrix[0].length; index2++) {
      if (matrix[index1][index2] == 0) {
        matrix[index1][0] = 0;
        matrix[0][index2] = 0;
      }
    }
  }

  for (int index1 = 1; index1 < matrix.length; index1++) {
    for (int index2 = 1; index2 < matrix[0].length; index2++) {
      if (matrix[index1][0] == 0 || matrix[0][index2] == 0) {
        matrix[index1][index2] = 0;
      }
    }
  }

  if (firstRowHasZero) {
    for (int index = 0; index < matrix[0].length; index++) {
      matrix[0][index] = 0;
    }
  }

  if (firstColHasZero) {
    for (int index = 0; index < matrix.length; index++) {
      matrix[index][0] = 0;
    }
  }

  print(matrix);
}
