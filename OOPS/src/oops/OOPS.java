package oops;

public class OOPS {

    public static int add(int a, int b) {
        return a + b;
    }
//public static float add(int a, int b) {
//        return a + b;
//    }

    public static float add(int a, float b) {
        return a + b;
    }

    public static int add(int a, int b, int c) {
        return a + b + c;
    }

    public static void main(String[] args) {
        System.out.println(add(7, 8));
        OOPS.add(0, 0);
        A.add(0, 0);
    }

}
