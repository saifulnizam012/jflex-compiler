import java.io.*;

public class A179830 {
    public static void main(String[] argv) {
        // find OfferLetter.txt
        File dirName = new File("OfferLetter.txt");  //read file OfferLetter.txt
        try {
            //import the OfferLetter.txt
            BufferedReader reader = new BufferedReader(new FileReader(dirName));
            StudentInfo jflex = new StudentInfo(reader); // pass to java jflex file
            // run jflex 
            jflex.yylex();
        } catch (Exception e) {
        }
    }

}