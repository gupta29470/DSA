import '../../node.dart';

void main() {
  Node? node = Node(1);
  node.next = Node(2);
  node.next?.next = Node(3);
  node.next?.next?.next = Node(4);

  print(linkedListLength(node));
}

int linkedListLength(Node? node) {
  if (node == null) {
    return 0;
  }

  if (node.next == null) {
    return 1;
  }

  int length = 0;

  Node? current = node;

  while (current != null) {
    length++;
    current = current.next;
  }

  return length;
}
