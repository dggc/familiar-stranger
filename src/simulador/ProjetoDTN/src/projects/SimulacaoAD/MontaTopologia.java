/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package projects.SimulacaoAD;

import projects.SimulacaoAD.nodes.timers.DTNtimer;
import projects.SimulacaoAD.nodes.timers.RemoveAresta;
import projects.SimulacaoAD.nodes.timers.TimerAddConn;
import sinalgo.nodes.Node;
import sinalgo.tools.Tools;

/**
 *
 * @author pedpano
 */
public class MontaTopologia
{
    private RemoveAresta removeAresta;
    private TimerAddConn timerAddConn;
   

    public MontaTopologia()
    {

    }

    public void montaTopologia(Node noAtual, String file)
    {
        LeXml lexml = new LeXml(file);

        /*System.out.println("num intervalo : "+lexml.getNumIntervalos());

        System.out.println("numeros de mac do intervalo1: "+lexml.getNumMacs(1));

        System.out.println("primeiroMac: "+lexml.getSpecificMac(1,1));*/

        int numIntervalos = lexml.getNumIntervalos();
        System.out.println("total intervalos: " + numIntervalos);

        for (int interval = 0; interval < numIntervalos; interval++) {
            int valorRelativo = interval * 300;
            if (valorRelativo == 0) {
                valorRelativo = 1;
            }

            removeAresta = new RemoveAresta(noAtual);
            removeAresta.startRelative(valorRelativo, noAtual);

            int totalMacs = lexml.getNumMacs(interval);
            System.out.println("total macs: " + totalMacs);

            if (totalMacs > 0) {
                for (int mac = 1; mac <= totalMacs; mac++) {
                    int specificMac = lexml.getSpecificMac(interval, mac);

                    System.out.println("MAC CAPTURADO: " + specificMac);
                    timerAddConn = new TimerAddConn(noAtual, Tools.getNodeByID(specificMac));
                    timerAddConn.startRelative(valorRelativo, noAtual);
                }
            }
        }
    }

}
