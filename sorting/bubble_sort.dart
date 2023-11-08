void main() {
  List<int> nums = [64, 25, 12, 22, 11];
  bubbleSort(nums);
  print(nums);
}

void bubbleSort(List<int> nums) {
  for (int index1 = 0; index1 < nums.length - 1; index1++) {
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      if (nums[index2] < nums[index1]) {
        swap(nums, index1, index2);
      }
    }
  }
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
}
