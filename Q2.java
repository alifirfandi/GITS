import java.util.Scanner;

public class Q2 {
    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        System.out.print("Enter email : ");
        String emailInput = userInput.next();

        boolean isValid = isValidEmail(emailInput);
        if (isValid) System.out.println("Email Valid!");
        else System.out.println("Email Invalid!");
    }

    private static boolean isValidEmail(String email) {
        // Check '@'
        if (!email.contains("@")) return false;

        // Split '@'
        String[] splitEmail = email.split("@");

        // Make sure only one '@'
        if (splitEmail.length != 2) return false;

        // Check '.' after '@'
        if (!splitEmail[1].contains(".")) return false;

        // Make sure email length less than equal to 20
        if (splitEmail[0].length() > 20) return false;

        // Allowed domain
        if (!splitEmail[1].contains(".co.id") && !splitEmail[1].contains(".id")) return false;

        return true;
    }
}
