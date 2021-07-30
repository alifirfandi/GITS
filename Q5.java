import java.util.Scanner;

public class Q5 {
    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        System.out.print("Enter Word : ");
        String wordInput = userInput.nextLine();

        System.out.println(isPalindrome(wordInput.toLowerCase()));
    }

    private static boolean isPalindrome(String word) {
        for (int i = 0; i < (word.length() - 1) / 2; i++) {
            if (word.charAt(i) != word.charAt(word.length() - i - 1)) {
                return false;
            }
        }
        return true;
    }
}
