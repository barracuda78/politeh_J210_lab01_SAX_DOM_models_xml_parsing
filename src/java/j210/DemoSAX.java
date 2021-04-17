package j210;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.SAXException;

public class DemoSAX {
    public final static String FILE_NAME = "D:\\coding\\politeh\\j210lab01\\sample_utf8.xml";
    
    public static List<User> parseXMLBySAX(){
        List<User> list = new ArrayList();
        File file = new File(FILE_NAME);
        if(file.exists()){
            System.out.println("Файл " + file.getAbsolutePath() + "найден.");
        }else{
            System.out.println("Файл не найден.");
        }
        
        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = null;
        
        try {
            parser = factory.newSAXParser();
            SAXHandler handler = new SAXHandler(list);
            parser.parse(file, handler);
        } catch (ParserConfigurationException ex) {
            System.out.println("Ошибка конфига парсера");
        } catch (SAXException ex) {
            System.out.println("Ошибка SAXException при разборе файла");
        } catch (IOException ex) {
            System.out.println("Ошибка IOException разборе файла");
        }
        
        return list;
    }
}
