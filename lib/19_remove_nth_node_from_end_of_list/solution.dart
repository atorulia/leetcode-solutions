void main(List<String> args) {
  print(Solution.removeNthFromEnd(ListNode.fromList([1, 2, 3, 4, 5]), 2));
}

class Solution {
  static ListNode? removeNthFromEnd(ListNode? head, int n) {
    if (head == null) return null;

    ListNode? fast = head, slow = head;

    for (int i = 0; i < n; i++) {
      fast = fast?.next;
    }

    if (fast == null) return head.next;
    while (fast?.next != null) {
      fast = fast?.next;
      slow = slow?.next;
    }

    slow?.next = slow.next?.next;

    return head;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  factory ListNode.fromList(List<int> list) {
    ListNode? head, current;
    for (int i = 0; i < list.length; i++) {
      if (head == null) {
        head = current = ListNode(list[i]);
      } else {
        current?.next = ListNode(list[i]);
        current = current?.next;
      }
    }
    return head!;
  }

  @override
  String toString() {
    return '$val${next != null ? ' -> $next' : ''}';
  }
}
