void main() {
  List<List<int>> matrix = [
    [5, 1, 9, 11],
    [2, 4, 8, 10],
    [13, 3, 6, 7],
    [15, 14, 12, 16],
  ];

  // List<List<int>> matrix = [
  //   [1, 2, 3],
  //   [4, 5, 6],
  //   [7, 8, 9],
  //   // [10, 11, 12],
  //   // [13, 14, 15],
  // ];

  rotate(matrix);
}

void rotate(List<List<int>> matrix) {
  rotate_3(matrix);
}

// Time: O(n^2)    Space: O(^2)
void rotate_1(List<List<int>> matrix) {
  List<List<int>> rotated = [];

  for (int index = 0; index < matrix[0].length; index++) {
    rotated.add(List.generate(matrix.length, (index) => 0));
  }

  int currentColumn = matrix.length - 1;

  for (int index1 = 0; index1 < matrix.length; index1++) {
    int currentRow = 0;
    for (int index2 = 0; index2 < matrix[0].length; index2++) {
      rotated[currentRow][currentColumn] = matrix[index1][index2];
      currentRow++;
    }

    currentColumn--;
  }
  print(rotated);
}

// Time: O(n^2)
void rotate_2(List<List<int>> matrix) {
  int index1 = 0, index2 = matrix.length - 1;

  // Swapping matrix
  while (index1 < index2) {
    for (int index = 0; index < matrix[0].length; index++) {
      int temp = matrix[index1][index];
      matrix[index1][index] = matrix[index2][index];
      matrix[index2][index] = temp;
    }

    index1++;
    index2--;
  }

  index1 = matrix.length - 1;
  index2 = matrix[0].length - 1;

  // Swapping element
  while (index1 > 0 && index2 > 0) {
    for (int index = 0; index <= index1; index++) {
      int temp = matrix[index1][index];
      matrix[index1][index] = matrix[index][index2];
      matrix[index][index2] = temp;
    }
    index1--;
    index2--;
  }

  print(matrix);
}

// Time: O(n^2)
void rotate_3(List<List<int>> matrix) {
  // Transpose the matirx
  for (int index1 = 1; index1 < matrix.length; index1++) {
    for (int index2 = 0; index2 < index1; index2++) {
      int temp = matrix[index1][index2];
      matrix[index1][index2] = matrix[index2][index1];
      matrix[index2][index1] = temp;
    }
  }

  // Swapping each row
  for (int index = 0; index < matrix.length; index++) {
    int startIndex = 0, endIndex = matrix[0].length - 1;

    while (startIndex < endIndex) {
      int temp = matrix[index][startIndex];
      matrix[index][startIndex] = matrix[index][endIndex];
      matrix[index][endIndex] = temp;

      startIndex++;
      endIndex--;
    }
  }

  print(matrix);
}
