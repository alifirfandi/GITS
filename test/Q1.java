import java.util.Scanner;

public class Q1 {
    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        System.out.print("Enter number : ");
        int numberInput = userInput.nextInt();

        System.out.println(helloWorld(numberInput));
    }

    private static String helloWorld(int number) {
        if (number % 3 == 0 && number % 5 == 0) return "Hello World";
        else if (number % 3 == 0) return "Hello";
        else if (number % 5 == 0) return "World";
        else return String.valueOf(number);
    }
}