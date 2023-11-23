void main() {
  List<int> nums1 = [7, 10, 14, 24, 26, 53, 55, 91, 91, 98];
  List<int> nums2 = [7, 10, 14, 24, 26, 52, 53, 78, 90, 91];

  print(union(nums1, nums2));
}

List<int> union(List<int> nums1, List<int> nums2) {
  return union_2(nums1, nums2);
}

// Time: O(n)    Space: O(n)
List<int> union_1(List<int> nums1, List<int> nums2) {
  Set<int> resultSet = Set<int>();

  for (int number in nums1) {
    resultSet.add(number);
  }

  for (int number in nums2) {
    resultSet.add(number);
  }

  return resultSet.toList();
}

// Time: O(nums1.length + nums2.length)
List<int> union_2(List<int> nums1, List<int> nums2) {
  List<int> result = [];
  int index1 = 0, index2 = 0;

  while (index1 < nums1.length && index2 < nums2.length) {
    if (nums1[index1] == nums2[index2]) {
      result.add(nums1[index1]);
      index1++;
      index2++;
    } else if (nums1[index1] < nums2[index2]) {
      index1++;
    } else {
      index2++;
    }
  }

  return result;
}
