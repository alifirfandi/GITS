import java.util.Scanner;

public class Q4 {
    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        System.out.print("Enter Word : ");
        String wordInput = userInput.nextLine();

        System.out.println(reverseWord(wordInput));
    }

    private static String reverseWord(String word) {
        char[] wordArrayOfChar = word.toCharArray();
        String reversedWord = "";
        for (int i = wordArrayOfChar.length - 1; i >= 0; i--) {
            reversedWord += wordArrayOfChar[i];
        }
        return reversedWord;
    }
}
