/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package projects.SimulacaoAD;

import java.io.File;
import org.jdom.Content;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

/**
 *
 * @author pedpano
 */
public class LeXml {

    private Document doc;
   

    public LeXml(String file) {
        //create a parser
        SAXBuilder parser = new SAXBuilder();
        try {
            File xmlDoc = new File(file);
            //get the dom-document
            doc = parser.build(xmlDoc);

        } catch (JDOMException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getNumIntervalos()
    {
        int temp =  Integer.parseInt(doc.getRootElement().getAttribute("intervalos").getValue());  
        return temp;
    }

    public int getNumMacs(int intervalo)
    {
        Element temp = (Element) doc.getRootElement().getChildren().get(intervalo);
        int result = Integer.parseInt(temp.getAttribute("macs").getValue());

        return result;
    }

    public int getSpecificMac(int intervalo, int posicaoMac)
    {
        Element temp = (Element) doc.getRootElement().getChildren().get(intervalo);
        int result = Integer.parseInt(temp.getContent(posicaoMac).getValue());

        /*System.out.println("xxxxxxxxx"+temp.getContent(posicaoMac).getValue());
        int result =10;*/

        return result;
    }
}


/*// illustrate some jdom tree walk and print sample
            System.out.println(doc.getRootElement().getName());
            Element firstChild = (Element) doc.getRootElement().getChildren().get(numero);
            System.out.println(">> " + firstChild.ge

                    getName() + ":" + firstChild.getAttribute("type").getValue());
            System.out.println(">>>>" + firstChild.getText());

            /*Element second = (Element) doc.getRootElement().getChildren().get(1);
            System.out.println("$$$: " + second.getText());

            Element quarto = (Element) doc.getRootElement().getChildren().get(3);
            System.out.println("NOVO: " + quarto.getChild("a").getText());*/