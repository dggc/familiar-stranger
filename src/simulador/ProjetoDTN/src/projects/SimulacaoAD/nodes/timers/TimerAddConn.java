/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package projects.SimulacaoAD.nodes.timers;


import sinalgo.nodes.Node;
import sinalgo.nodes.timers.Timer;
import sinalgo.tools.Tools;

/**
 *
 * @author pedpano
 */
public class TimerAddConn extends Timer {

    Node nodeOrigem;
    Node nodeDestino;

    public TimerAddConn(Node nodeOrigem , Node nodeDestino )
    {
        this.nodeOrigem = nodeOrigem;
        this.nodeDestino = nodeDestino;
    }

    @Override
    public void fire() {

        nodeOrigem.addConnectionTo(nodeDestino);
        System.out.println("CONEXAO ADICIONADA: "+Tools.getGlobalTime()+" ORIGEM: "+nodeOrigem.ID+" DEST: "+nodeDestino.ID);
    }
}
