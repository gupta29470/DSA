import '../../node.dart';

void main() {
  Node? node = Node(1);
  node.next = Node(2);
  node.next?.next = Node(3);
  node.next?.next?.next = Node(4);

  Node inserted = insertAtBeginning(node, 5);
  Node? head = inserted;

  while (head != null) {
    print(head.data);
    head = head.next;
  }
}

Node insertAtBeginning(Node? node, int data) {
  if (node == null) {
    return Node(data);
  }

  Node newHead = Node(data);
  newHead.next = node;

  return newHead;
}
