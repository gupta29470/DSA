void main() {
  List<int> nums = [64, 25, 12, 22, 11];
  selectionSort(nums);
  print(nums);
}

void selectionSort(List<int> nums) {
  for (int index1 = 0; index1 < nums.length - 1; index1++) {
    int minElementIndex = index1;
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      if (nums[index2] < nums[minElementIndex]) {
        minElementIndex = index2;
      }
    }
    swap(nums, index1, minElementIndex);
  }
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
}
