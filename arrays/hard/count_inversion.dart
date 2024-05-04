void main() {
  List<int> nums = [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  countInversions(nums);
}

void countInversions(List<int> nums) {
  countInversions_2(nums);
}

void countInversions_1(List<int> nums) {
  int result = 0;

  for (int index1 = 0; index1 < nums.length; index1++) {
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      if (nums[index2] < nums[index1]) {
        result++;
      }
    }
  }

  print(result);
}

void countInversions_2(List<int> nums) {
  print(mergeSort(nums, 0, nums.length - 1));
}

int mergeSort(List<int> nums, int left, int right) {
  int count = 0;
  if (left < right) {
    int middle = (left + right) ~/ 2;
    count += mergeSort(nums, left, middle);
    count += mergeSort(nums, middle + 1, right);
    count += mergeAndCount(nums, left, middle, right);
  }

  return count;
}

int mergeAndCount(List<int> nums, int left, int middle, int right) {
  List<int> temp = [];
  int index1 = left, index2 = middle + 1;
  int count = 0;

  while (index1 <= middle && index2 <= right) {
    if (nums[index1] <= nums[index2]) {
      temp.add(nums[index1]);
      index1++;
    } else {
      temp.add(nums[index1]);
      count += (middle - left) + 1;
      index2++;
    }
  }

  while (index1 <= middle) {
    temp.add(nums[index1]);
    index1++;
  }

  while (index2 <= right) {
    temp.add(nums[index1]);
    index2++;
  }

  for (int index = left; index <= right; index++) {
    nums[index] = temp[index - left];
  }

  return count;
}
