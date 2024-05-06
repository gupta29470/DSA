import '../../node.dart';

void main() {
  Node? node = Node(1);
  node.next = Node(2);
  node.next?.next = Node(3);
  node.next?.next?.next = Node(4);

  print(elementContains(node, 2));
}

bool elementContains(Node? node, int data) {
  if (node == null || (node.next == null && node.data != data)) {
    return false;
  }

  Node? current = node;

  while (current != null) {
    if (current.data == data) {
      return true;
    }
    current = current.next;
  }

  return false;
}
