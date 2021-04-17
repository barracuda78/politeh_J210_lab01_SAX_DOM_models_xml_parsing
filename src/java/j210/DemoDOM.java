package j210;

import static j210.DemoSAX.FILE_NAME;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;


public class DemoDOM {
     public final static String FILE_NAME = "D:\\coding\\politeh\\j210lab01\\sample_utf8.xml";
     
    public static List<User> parseXMLByDOM() {
        List<User> list = new ArrayList();
        File file = new File(FILE_NAME);
        if (file.exists()) {
            System.out.println("Файл " + file.getAbsolutePath() + "найден.");
        } else {
            System.out.println("Файл не найден.");
        }
        
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = null;
         try {
             docBuilder = factory.newDocumentBuilder();
         } catch (ParserConfigurationException ex) {
             System.out.println("Ошибка создания documentBuilder = " + ex.getMessage());
         }
         
         Document document = null;
        if (docBuilder != null) {
            try {
                document = docBuilder.parse(file);
            } catch (SAXException ex) {
                System.out.println("Ошибка SAXException docBuilder.parse(file) = " + ex.getMessage());
            } catch (IOException ex) {
                System.out.println("Ошибка IOException docBuilder.parse(file) = " + ex.getMessage());
            }
        }
        
        System.out.println("DocumentBuilder = " + docBuilder);
        System.out.println("Document = " + document);
        
        NodeList nodeList = document.getElementsByTagName("user");
        
        for (int i = 0; i < nodeList.getLength(); i++) {
            //System.out.println("User: " + nodeList.item(i).getLocalName());
//            Attributes attributes = (Attributes)nodeList.item(i).getAttributes();  //--->ClassCastException!!!
//            int numAttr = attributes.getLength();
//            for(int j = 0; j < numAttr; j++){
//                System.out.print(attributes.getQName(j) + "=" + attributes.getValue(j));
//            }
            list.add(getUserFromNode(nodeList.item(i)));

        }
        
        return list;
    }

    private static User getUserFromNode(Node item) {
        User user = null;
        if(item.getNodeType() == Node.ELEMENT_NODE){
            Element element = (Element)item;
            String firstName = getTagValue(element, "first-name");
            String family = getTagValue(element, "family");
            
//            System.out.println("firstName = " + firstName + " TextContent: " + item.getTextContent());
//            System.out.println("family = " + family);

            //теперь аттрибуты:
            //item.getTextContent();
            int id = -1;
            try{
            id = Integer.parseInt(element.getAttribute("id"));
            }catch(NumberFormatException e){
                System.out.println("Ошибка преобразования id");
            }
            String role = element.getAttribute("role");
            NodeList depList = element.getElementsByTagName("department");
            String department = ((Element)depList.item(0)).getAttribute("title");
            user = new User(id, role, firstName, family, department);
            System.out.println("Создан user: " + user.toString());
        }
        return user;
    }

    private static String getTagValue(Element element, String tag) {
        NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
        Node node = (Node)nodeList.item(0);
        return node.getNodeValue();
    }
}
