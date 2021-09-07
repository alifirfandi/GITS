import java.util.Scanner;

public class Q3 {
    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        System.out.print("Enter Time : ");
        String inputTime = userInput.nextLine();

        System.out.println(convertDateTime(inputTime.trim()));
    }

    private static String convertDateTime(String time){
        if(time.contains("AM") || time.contains("am")){
            return time.substring(0, time.length() - 2).trim();
        }

        String hourConverted = String.valueOf(Integer.parseInt(time.substring(0,2)) + 12);
        if(hourConverted.equals("24")) hourConverted = "00";
        return hourConverted + time.substring(2, time.length() - 2).trim();
    }
}

