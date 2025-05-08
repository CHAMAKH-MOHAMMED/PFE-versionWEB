/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author vPro
 */
import java.sql.Connection;
import java.sql.DriverManager;

public final class DB {
    public Connection con;
    public static DB db;
    private String url;
    private String dbName;
    private String charsetEncoding;
    private String driver;
    private String userName;
    private String password;
    
    private DB() {
            this.dbName="sevragetabagique";
            this.url="jdbc:mysql://localhost:3306/";
            this.userName="root";
            this.password="";
            this.charsetEncoding="?characterEncoding=utf-8";
            this.driver="com.mysql.jdbc.Driver";
            try {
                DriverManager.registerDriver( new com.mysql.jdbc.Driver());
                this.con = (Connection)DriverManager.getConnection(url+dbName+charsetEncoding,userName,password);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
    }
    /**
     *
     * @return DB objet
     */
    public static synchronized DB getInstance() {
        if ( db == null ) {
            db = new DB();
        }
        return db;
    }
}
