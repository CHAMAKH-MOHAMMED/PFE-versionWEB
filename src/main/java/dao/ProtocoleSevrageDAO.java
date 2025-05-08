/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import entity.ProtocoleSevrage;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author vPro
 */
public class ProtocoleSevrageDAO {
    private Connection con;
	
	public ProtocoleSevrageDAO() {
		this.con = DB.getInstance().con;
	}
	public void insert(ProtocoleSevrage protocoleSevrage) throws SQLException{
                //TODO
	}
	public ProtocoleSevrage getById(int id) throws SQLException{
		//TODO
                return null;
	}
	
}
