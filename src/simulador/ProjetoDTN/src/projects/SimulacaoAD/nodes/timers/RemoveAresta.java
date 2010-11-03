/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package projects.SimulacaoAD.nodes.timers;

import projects.SimulacaoAD.nodes.nodeImplementations.SimpleNode;
import sinalgo.nodes.Node;
import sinalgo.nodes.timers.Timer;
import sinalgo.tools.Tools;

/**
 *
 * @author pedpano
 */
public class RemoveAresta extends Timer
{
    Node node;

    public RemoveAresta(Node node)
    {
        this.node =  node;
    }

    @Override
    public void fire() {
        
        node.removeTodasArestas();

        System.out.println("CONEXOES REMOVIDAS: "+Tools.getGlobalTime()+" NODO: "+node.ID);
    }

}
