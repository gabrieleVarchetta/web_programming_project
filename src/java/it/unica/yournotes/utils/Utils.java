/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.unica.yournotes.utils;

import it.unica.yournotes.exceptions.InvalidParamException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.http.Part;

/**
 *
 * @author gabriele
 */
public class Utils {

    //se un campo è null, lancia l'eccezione specificando il campo che manca
    private static void checkNull(String name, String param) throws InvalidParamException {
        if (param == null) {
            throw new InvalidParamException("Errore, valore del campo " + name + " mancante");
        }
    }

    //controlla che le stringhe passate siano valide
    public static void checkString(String name, String param, int min, int max) throws InvalidParamException {
        checkNull(name, param);

        if (param.length() < min || param.length() > max) {
            throw new InvalidParamException("Errore, il campo " + name + " deve avere una lunghezza compresa tra " + min + " e " + max);
        }
    }

    public static void checkInteger(String name, String param, int min, int max) throws InvalidParamException {
        checkNull(name, param);

        try {
            int value = Integer.valueOf(param);

            if (value < min || value > max) {
                throw new InvalidParamException("Errore, il campo " + name + " deve avere una dimensione compresa tra " + min + " e " + max);
            }
        } catch (NumberFormatException e) {
            throw new InvalidParamException("Errore, il campo " + name + " deve essere un numero intero");
        }
    }

    public static String uploadImageToServer(Part file) {

        String path = "http://localhost:8080/FPW_Project/web/images/";

        try ( InputStream fileContent = file.getInputStream()) {
            File toSave = new File("/Users/gabriele/Desktop/FPW_Project/web/images/" + file.getSubmittedFileName());

            Files.copy(fileContent, toSave.toPath(), StandardCopyOption.REPLACE_EXISTING);

            path += file.getSubmittedFileName();

        } catch (IOException e) {
            e.printStackTrace();
        }

        return path;
    }

}
