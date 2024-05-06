import '../../node.dart';

void main() {
  Node? node = Node(1);
  node.next = Node(2);
  node.next?.next = Node(3);
  node.next?.next?.next = Node(4);

  Node? deleted = deleteNode(node, 1);
  Node? head = deleted;

  while (head != null) {
    print(head.data);
    head = head.next;
  }
}

Node? deleteNode(Node? node, int data) {
  if (node == null) {
    return null;
  }

  if (node.data == data) {
    return node.next;
  }

  Node? head = node;

  while (head?.next != null) {
    if (head?.next?.data == data) {
      head?.next = head.next?.next;
      return node;
    } else {
      head = head?.next;
    }
  }

  return node;
}
