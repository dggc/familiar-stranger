/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package projects.SimulacaoAD.nodes.nodeImplementations;

import java.io.File;
import java.io.IOException;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.DOMOutputter;
import projects.SimulacaoAD.LeXml;
import projects.SimulacaoAD.MontaTopologia;
import projects.SimulacaoAD.nodes.messages.MensagemDTN;
import projects.SimulacaoAD.nodes.timers.DTNtimer;
import projects.SimulacaoAD.nodes.timers.RemoveAresta;
import projects.SimulacaoAD.nodes.timers.TimerAddConn;
import sinalgo.configuration.WrongConfigurationException;
import sinalgo.nodes.Node;
import sinalgo.nodes.messages.Inbox;
import sinalgo.nodes.messages.Message;
import sinalgo.tools.Tools;

/**
 *
 * @author pedpano
 */
public class SimpleNode extends Node {


    boolean marca = true;

    private DTNtimer dtntimer;
    private MontaTopologia montaTopologia;
    
    @Override
    public void handleMessages(Inbox inbox) {
        while(inbox.hasNext())
        {
            Message msg = inbox.next();
            if(msg instanceof MensagemDTN)
            {
                MensagemDTN msgDTN = (MensagemDTN)msg;
                System.out.println("nodo: "+this.ID+" msgRecebida: "+msgDTN.numero+" tempo: "+Tools.getGlobalTime());
            }
        }
    }

    @Override
    public void preStep() {
     
        if(marca)
        {
            if(ID ==1)
            {
                montaTopologia.montaTopologia(this, "intervalosNodo1.xml");

                //A contagem dos nodos filhos no arquivo XML comeca do 0
                //A contagem dos contents (representando os macs) comeca do zero
                MensagemDTN msg = new MensagemDTN(2154);

                dtntimer = new DTNtimer(msg);
                dtntimer.startRelative(320, this);

                dtntimer = new DTNtimer(msg);
                dtntimer.startRelative(610, this);

                marca = false;
            }
            if(ID == 2)
            {
                montaTopologia.montaTopologia(this, "intervalosNodo2.xml");

                MensagemDTN msg = new MensagemDTN(255555);
                dtntimer = new DTNtimer(msg);
                dtntimer.startRelative(301, this);

                dtntimer = new DTNtimer(msg);
                dtntimer.startRelative(730, this);

                marca = false;
            }  
        }
    }

    @Override
    public void init() {
        //throw new UnsupportedOperationException("Not supported yet.");
        montaTopologia = new MontaTopologia();

        System.out.println("init");

    }

    @Override
    public void neighborhoodChange() {
        //throw new UnsupportedOperationException("Not supported yet.");
        //System.out.println("neighborChange");
    }

    @Override
    public void postStep() {
        //throw new UnsupportedOperationException("Not supported yet.");
        //System.out.println("posstep");
    }

    @Override
    public void checkRequirements() throws WrongConfigurationException
    {
        //System.out.println("num nodos--: "+Tools.getNodeList().size());
        //Node teste2 = Tools.getNodeByID(1);
    }
}