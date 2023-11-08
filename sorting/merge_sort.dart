void main() {
  List<int> nums = [64, 25, 12, 22, 11];
  mergeSort(nums);
  print(nums);
}

void mergeSort(List<int> nums) {
  int left = 0, right = nums.length - 1;

  divideArray(nums, left, right);
}

void divideArray(List<int> nums, int left, right) {
  if (left < right) {
    int middle = (left + right) ~/ 2;

    divideArray(nums, left, middle);
    divideArray(nums, middle + 1, right);

    mergeArray(nums, left, middle, right);
  }
}

void mergeArray(List<int> nums, int left, int middle, int right) {
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

  for (int index = left; index <= right; index++) {
    nums[index] = temp[index - left];
  }
}
