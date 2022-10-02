/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Exception.java to edit this template
 */
package it.unica.yournotes.exceptions;

/**
 *
 * @author gabriele
 */
public class InvalidParamException extends Exception {

    /**
     * Creates a new instance of <code>InvalidParamException</code> without
     * detail message.
     */
    public InvalidParamException() {
    }

    /**
     * Constructs an instance of <code>InvalidParamException</code> with the
     * specified detail message.
     *
     * @param msg the detail message.
     */
    public InvalidParamException(String msg) {
        super(msg);
    }
}
