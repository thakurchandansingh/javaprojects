
import java.util.Arrays;

public class array {

    public static int findLeft(int[] a, int pos) {
        int value = a[pos];
        int i = pos - 1;
        while (i >= 0) {
            if (a[i] > value) {
                return pos - i;
            }
            i--;
        }

        return -1;
    }

    public static int right(int[] a, int pos) {
        int value = a[pos];
        int i = pos + 1;
        while (i <= a.length - 1) {
            if (a[i] > value) {
                return i - pos;
            }
            i++;
        }

        return -1;
    }

    public static void main(String[] args) {
        int a[] = {10, 10, 20, 10, 5, 30, 10};//4,2,6,2,2,0,2
        //2,1,3,1,1,0,1
        int[] leftpositions = new int[a.length];
        int[] rightposition = new int[a.length];
        int[] answers = new int[a.length];
        for (int i = 0; i <= a.length - 1; i++) {
            int left = findLeft(a, i);
            leftpositions[i] = left;

            int rt = right(a, i);
            rightposition[i] = rt;
            if (left == -1 && rt == -1) {
                answers[i] = 0;
            } else if (left == -1) {
                answers[i] = 2 * rt;
            } else if (rt == -1) {
                answers[i] = 2 * left;
            } else {
                answers[i] = 2 * Math.min(left, rt);
            }
        }
        System.out.println(Arrays.toString(leftpositions));
        System.out.println(Arrays.toString(rightposition));
        System.out.println(Arrays.toString(answers));

    }
}
