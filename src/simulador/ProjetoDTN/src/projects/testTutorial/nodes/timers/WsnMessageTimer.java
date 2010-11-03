/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package projects.testTutorial.nodes.timers;


import projects.testTutorial.nodes.messages.WsnMsg;
import projects.testTutorial.nodes.nodeImplementations.SimpleNode;
import sinalgo.nodes.timers.Timer;

/**
 *
 * @author pedpano
 */
public class WsnMessageTimer extends Timer{

    private WsnMsg message = null;

    public WsnMessageTimer(WsnMsg message) {
        this.message = message;
    }

    @Override
    public void fire() {
        ((SimpleNode) node).broadcast(message);
    }


}
