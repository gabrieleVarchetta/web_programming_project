/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.unica.yournotes.model;

import it.unica.yournotes.database.DatabaseManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gabriele
 */
public class UtenteFactory {

    private static UtenteFactory instance;

    public static UtenteFactory getInstance() {
        if (instance == null) {
            instance = new UtenteFactory();
        }

        return instance;
    }

    public Utente getUserByUserAndPsw(String user, String psw) {
        Connection conn = null;
        PreparedStatement stmnt = null;
        ResultSet set = null;

        try {
            //stabiliamo una connessione con il DB tramite il nostro DatabaseManager
            conn = DatabaseManager.getInstance().getDbConnection();

            //creiamo la query con il PreparedStatement per evitare query injection
            String query = "SELECT * FROM utente WHERE username = ? AND password = ?";
            stmnt = conn.prepareStatement(query);
            stmnt.setString(1, user);
            stmnt.setString(2, psw);

            set = stmnt.executeQuery();

            if (set.next()) {
                Utente utente = new Utente();

                utente.setUsername(set.getString("username"));
                utente.setPassword(set.getString("password"));
                utente.setNome(set.getString("nome"));
                utente.setCognome(set.getString("cognome"));
                utente.setEmail(set.getString("email"));
                utente.setCitta(set.getString("citta"));

                return utente;
            } else {
                return null;
            }

        } catch (SQLException e) {
            Logger.getLogger(UtenteFactory.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                set.close();
            } catch (Exception e) {
            }
            try {
                stmnt.close();
            } catch (Exception e) {
            }
            try {
                conn.close();
            } catch (Exception e) {
            }
        }

        return null;
    }

    public List<Utente> getAllUsers() {
        Connection conn = null;
        PreparedStatement stmnt = null;
        ResultSet set = null;

        List<Utente> utenti = new ArrayList<>();

        try {
            conn = DatabaseManager.getInstance().getDbConnection();
            String query = "SELECT * FROM utente";
            stmnt = conn.prepareStatement(query);
            set = stmnt.executeQuery();

            while (set.next()) {
                Utente utente = new Utente();

                utente.setNome(set.getString("nome"));
                utente.setCognome(set.getString("cognome"));
                utente.setPassword(set.getString("password"));
                utente.setCitta(set.getString("citta"));
                utente.setEmail(set.getString("email"));
                utente.setUsername(set.getString("username"));

                utenti.add(utente);
            }

            return utenti;
        } catch (SQLException e) {
            Logger.getLogger(ProdottoFactory.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                set.close();
            } catch (Exception e) {
            }
            try {
                stmnt.close();
            } catch (Exception e) {
            }
            try {
                conn.close();
            } catch (Exception e) {
            }
        }

        return null;
    }

    public void addUserToDb(String name, String surname, String mail, String city, String user, String psw) {
        Connection conn = null;
        PreparedStatement stmnt = null;

        try {
            conn = DatabaseManager.getInstance().getDbConnection();
            String query = "INSERT INTO utente VALUES(?, ?, ?, ?, ?, ?)";
            stmnt = conn.prepareStatement(query);
            stmnt.setString(1, user);
            stmnt.setString(2, psw);
            stmnt.setString(3, name);
            stmnt.setString(4, surname);
            stmnt.setString(5, mail);
            stmnt.setString(6, city);

            stmnt.executeUpdate();
        } catch (SQLException e) {

        } finally {
            try {
                stmnt.close();
            } catch (Exception e) {
            }
            try {
                conn.close();
            } catch (Exception e) {
            }
        }
    }

}
