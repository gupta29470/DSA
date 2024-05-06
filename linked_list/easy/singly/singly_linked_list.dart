import '../../node.dart';

void main() {
  Node? node = Node(1);
  node.next = Node(2);
  node.next?.next = Node(3);
  node.next?.next?.next = Node(4);

  while (node != null) {
    print(node.data);
    node = node.next;
  }
}
