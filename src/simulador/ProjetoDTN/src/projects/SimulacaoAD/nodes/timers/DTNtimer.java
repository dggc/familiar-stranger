/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package projects.SimulacaoAD.nodes.timers;

import projects.SimulacaoAD.nodes.messages.MensagemDTN;
import projects.SimulacaoAD.nodes.nodeImplementations.SimpleNode;
import sinalgo.nodes.Node;
import sinalgo.nodes.timers.Timer;
import sinalgo.tools.Tools;



/**
 *
 * @author pedpano
 */
public class DTNtimer extends Timer{

    private MensagemDTN msg = null;
    private Node cabuloso;
    
    // passar como parametro o no da outra ponta da aresta
    public DTNtimer(MensagemDTN msg)
    {
        this.msg = msg;
    }

    @Override
    public void fire() {
        //((SimpleNode)node).broadcast(msg);

        //((SimpleNode)node).removeConnection(cabuloso);
        ((SimpleNode)node).broadcast(msg);
        System.out.println("Tentativa Envio: "+Tools.getGlobalTime()+" nodo: "+((SimpleNode)node).ID);

    }

}
