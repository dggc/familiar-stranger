/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package projects.SimulacaoAD.nodes.messages;

import sinalgo.nodes.messages.Message;

/**
 *
 * @author pedpano
 */
public class MensagemDTN extends Message{

    public Integer numero ;

    public MensagemDTN(Integer numero)
    {
        this.numero = numero;
    }

    @Override
    public Message clone() {
        //MensagemDTN msg = new MensagemDTN(numero);
        //return msg;

        return this; //estou assumindo que nao vou alterar a instancia da mensagem.
    }

}
