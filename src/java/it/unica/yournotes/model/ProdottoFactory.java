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
import javax.servlet.http.HttpSession;

/**
 *
 * @author gabriele
 */
public class ProdottoFactory {

    private static ProdottoFactory instance;

    public static ProdottoFactory getInstance() {
        if (instance == null) {
            instance = new ProdottoFactory();
        }

        return instance;
    }

    public List<Prodotto> getProductsByUser(String username) {
        Connection conn = null;
        PreparedStatement stmnt = null;
        ResultSet set = null;

        List<Prodotto> prodottiByUser = new ArrayList<>();

        try {
            conn = DatabaseManager.getInstance().getDbConnection();
            String query = "SELECT * FROM prodotto WHERE utente_id = ?";
            stmnt = conn.prepareStatement(query);
            stmnt.setString(1, username);
            set = stmnt.executeQuery();

            while (set.next()) {
                Prodotto prodotto = new Prodotto();

                prodotto.setId(set.getLong("id"));
                prodotto.setNome(set.getString("nome"));
                prodotto.setDescrizione(set.getString("descrizione"));
                prodotto.setPrezzo(set.getInt("prezzo"));
                prodotto.setnPagine(set.getInt("npagine"));
                prodotto.setAnnoAccademico(set.getInt("annoaccademico"));
                prodotto.setDimensione(set.getInt("dimensione"));
                prodotto.setPathToImg(set.getString("immagine"));
                prodotto.setUtenteId(set.getString("utente_id"));
                prodotto.setFormato(set.getString("formato"));

                prodottiByUser.add(prodotto);
            }

            return prodottiByUser;
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

    public List<Prodotto> getAllProducts() {
        Connection conn = null;
        PreparedStatement stmnt = null;
        ResultSet set = null;

        List<Prodotto> prodotti = new ArrayList<>();

        try {
            conn = DatabaseManager.getInstance().getDbConnection();
            String query = "SELECT * FROM prodotto";
            stmnt = conn.prepareStatement(query);
            set = stmnt.executeQuery();

            while (set.next()) {
                Prodotto prodotto = new Prodotto();

                prodotto.setId(set.getLong("id"));
                prodotto.setNome(set.getString("nome"));
                prodotto.setDescrizione(set.getString("descrizione"));
                prodotto.setPrezzo(set.getInt("prezzo"));
                prodotto.setnPagine(set.getInt("npagine"));
                prodotto.setAnnoAccademico(set.getInt("annoaccademico"));
                prodotto.setDimensione(set.getInt("dimensione"));
                prodotto.setPathToImg(set.getString("immagine"));
                prodotto.setUtenteId(set.getString("utente_id"));
                prodotto.setFormato(set.getString("formato"));

                prodotti.add(prodotto);
            }

            return prodotti;
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

    public Prodotto getProduct(String offset) {
        Connection conn = null;
        PreparedStatement stmnt = null;
        ResultSet set = null;

        Prodotto prodotto = new Prodotto();

        try {
            conn = DatabaseManager.getInstance().getDbConnection();
            String query = "SELECT * FROM prodotto LIMIT 1 OFFSET ?";
            stmnt = conn.prepareStatement(query);
            stmnt.setInt(1, Integer.parseInt(offset));
            set = stmnt.executeQuery();

            while (set.next()) {
                prodotto.setId(set.getLong("id"));
                prodotto.setNome(set.getString("nome"));
                prodotto.setDescrizione(set.getString("descrizione"));
                prodotto.setPrezzo(set.getInt("prezzo"));
                prodotto.setnPagine(set.getInt("npagine"));
                prodotto.setAnnoAccademico(set.getInt("annoaccademico"));
                prodotto.setDimensione(set.getInt("dimensione"));
                prodotto.setPathToImg(set.getString("immagine"));
                prodotto.setUtenteId(set.getString("utente_id"));
                prodotto.setFormato(set.getString("formato"));
            }
            return prodotto;
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

    public void addProductToDb(String name, String description, String price, String pages, String year, String size, String format, String imgPath, HttpSession session) {
        Connection conn = null;
        PreparedStatement stmnt = null;

        try {
            conn = DatabaseManager.getInstance().getDbConnection();
            String query = "INSERT INTO prodotto VALUES(default, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            stmnt = conn.prepareStatement(query);
            stmnt.setString(1, name);
            stmnt.setString(2, description);
            stmnt.setInt(3, Integer.valueOf(price));
            stmnt.setInt(4, Integer.valueOf(pages));
            stmnt.setInt(5, Integer.valueOf(year));
            stmnt.setInt(6, Integer.valueOf(size));
            stmnt.setString(7, imgPath);
            stmnt.setString(8, session.getAttribute("username").toString());
            stmnt.setString(9, format);

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
