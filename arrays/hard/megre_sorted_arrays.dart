void main() {
  List<int> array1 = [1, 2, 4, 6, 9];
  List<int> array2 = [2, 3, 5, 7, 8];

  mergeArray(array1, array2);
}

void mergeArray(List<int> array1, List<int> array2) {
  mergeArray_3(array1, array2);
}

void mergeArray_1(List<int> array1, List<int> array2) {
  List<int> merged = [];
  merged.addAll(array1);
  merged.addAll(array2);
  merged.sort();

  print(merged);
}

void mergeArray_2(List<int> array1, List<int> array2) {
  List<int> merged = [];
  int index1 = 0, index2 = 0;

  while (index1 < array1.length && index2 < array2.length) {
    if (array1[index1] < array2[index2]) {
      merged.add(array1[index1]);
      index1++;
    } else if (array1[index1] > array2[index2]) {
      merged.add(array2[index2]);
      index2++;
    } else {
      merged.add(array1[index1]);
      merged.add(array2[index2]);
      index1++;
      index2++;
    }
  }

  while (index1 < array1.length) {
    merged.add(array1[index1]);
    index1++;
  }

  while (index2 < array2.length) {
    merged.add(array2[index2]);
    index2++;
  }

  print(merged);
}

void mergeArray_3(List<int> array1, List<int> array2) {
  int index1 = array1.length - 1, index2 = array2.length - 1;

  for (int index = 0; index < array2.length; index++) {
    array1.add(0);
  }

  int placeIndex = array1.length - 1;

  while (index1 >= 0 && index2 >= 0) {
    if (array1[index1] > array2[index2]) {
      array1[placeIndex] = array1[index1];
      index1--;
      placeIndex--;
    } else if (array1[index1] < array2[index2]) {
      array1[placeIndex] = array2[index2];
      index2--;
      placeIndex--;
    } else {
      array1[placeIndex] = array1[index1];
      index1--;
      placeIndex--;
      array1[placeIndex] = array2[index2];
      index2--;
      placeIndex--;
    }
  }

  while (index1 >= 0) {
    array1[placeIndex] = array1[index1];
    index1--;
    placeIndex--;
  }

  while (index2 >= 0) {
    array1[placeIndex] = array2[index2];
    index2--;
    placeIndex--;
  }

  print(array1);
}
