void main() {
  List<int> nums = [10, 25, 5, 15, 5, 20, 30, 4, 1, 6, 12, 8, 14, 3, 2];

  reversePairs(nums);
}

void reversePairs(List<int> nums) {
  reversePairs_2(nums);
}

void reversePairs_1(List<int> nums) {
  int result = 0;

  for (int index1 = 0; index1 < nums.length; index1++) {
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      if ((2 * nums[index2]) < nums[index1]) {
        result++;
      }
    }
  }

  print(result);
}

void reversePairs_2(List<int> nums) {
  int left = 0, right = nums.length - 1;

  print(mergeSort(nums, left, right));
}

int mergeSort(List<int> nums, int left, int right) {
  int count = 0;
  if (left < right) {
    int middle = (left + right) ~/ 2;

    count += mergeSort(nums, left, middle);
    count += mergeSort(nums, middle + 1, right);
    count += countPairs(nums, left, middle, right);
    merge(nums, left, middle, right);
  }

  return count;
}

int countPairs(List<int> nums, int left, int middle, int right) {
  int index1 = left, index2 = middle + 1;
  int count = 0;
  while (index1 <= middle) {
    while (index2 <= right && nums[index1] > (2 * nums[index2])) {
      index2++;
    }
    index1++;
    count += (index2 - (middle + 1));
  }

  return count;
}

void merge(List<int> nums, int left, int middle, int right) {
  int index1 = left, index2 = middle + 1;
  List<int> temp = [];

  while (index1 <= middle && index2 <= right) {
    if (nums[index1] <= nums[index2]) {
      temp.add(nums[index1]);
      index1++;
    } else {
      temp.add(nums[index2]);
      index2++;
    }
  }

  while (index1 <= middle) {
    temp.add(nums[index1]);
    index1++;
  }

  while (index2 <= right) {
    temp.add(nums[index2]);
    index2++;
  }

  for (int index = 0; index < temp.length; index++) {
    nums[left + index] = temp[index];
  }
}
