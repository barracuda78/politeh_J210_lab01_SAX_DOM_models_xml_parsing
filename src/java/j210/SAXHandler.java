package j210;


import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

public class SAXHandler extends DefaultHandler{
    int id;
    String role;
    String firstName;
    String family;
    String department;
    
    private List<User> list;
    boolean inUser;
    boolean inFirstName;
    boolean inFamily;

    public SAXHandler(List<User> list) {
        this.list = list;
    }
    
    @Override
    public void startDocument(){
        System.out.println("SAXHandler начинает анализировать файл");
    }
    
    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes){
        
        int numAttr = attributes.getLength();
        for(int i = 0; i < numAttr; i++){
            System.out.print(attributes.getQName(i) + "=" + attributes.getValue(i));
            if(attributes.getQName(i).equals("id")){
                try{
                id = Integer.parseInt(attributes.getValue(i));
                }catch(NumberFormatException e){
                    System.out.println("Ошибка class SAXHandler method startElement = невозможно преобразовать id к числу.");
                }
            }else if(attributes.getQName(i).equals("role")){
                role = attributes.getValue(i);
            }
            else if(attributes.getQName(i).equals("title")){
                department = attributes.getValue(i);
            }
        }
        System.out.println("");
        
        switch(qName){
            case "user": 
                inUser = true;
                System.out.println("inUser = true");
                break;
            case "first-name": 
                inFirstName = true;
                System.out.println("inFirstName = true");
                break;  
            case "family":
                inFamily = true;
                System.out.println("inFamily = true");
                break;
        }
        
    }
    
    @Override
    public void endElement(String uri, String localName, String qName){
        switch(qName){
            case "user": 
                //(int id, String role, String firstName, String family, String department)
                User user = new User (id, role, firstName, family, department);
                list.add(user);
                inUser = false;
                System.out.println("inUser = false");
                break;
            case "first-name": 
                inFirstName = false;
                System.out.println("inFirstName = false");
                break; 
            case "family":
                inFamily = false;
                System.out.println("inFamily = false");
                break;        
        }
    }
    
    @Override
    public void characters(char[] buf, int start, int length){
        if(inUser){
            if(inFirstName){
                firstName = new String(buf, start, length);
                System.out.println("firstName = " + firstName);
                inFirstName = false;
            }
            if(inFamily){
                family = new String(buf, start, length);
                System.out.println("family = " + family);
                inFamily = false;
            }

        }
    }
    
    @Override
    public void endDocument(){
        System.out.println("SAXHandler завершил анализ файла.");

    }
}
