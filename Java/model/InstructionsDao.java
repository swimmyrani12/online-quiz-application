package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.Instructions;
import db.Provider;

public class InstructionsDao {

    public static ArrayList<Instructions> getAllRecords() {
        ArrayList<Instructions> list = new ArrayList<Instructions>();
        try {
            Connection con = Provider.getOracleConnection();
            String sql = "select * from instructiontable"; 
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Instructions inst = new Instructions();
                inst.setInstruction(rs.getString(1));
                list.add(inst);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int insertInstruction(Instructions inst) {
        int status = 0;
        try {
            Connection con = Provider.getOracleConnection();
            String sql = "insert into instructiontable values(?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, inst.getInstruction());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int deleteRecord(Instructions inst) {
        int status = 0;
        try {
            Connection con = Provider.getOracleConnection();
            String sql = "delete from instructiontable where instruction = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, inst.getInstruction());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int deleteInstruction(String instText) {
        Instructions inst = new Instructions();
        inst.setInstruction(instText);
        return deleteRecord(inst);
    }

    // updateinstructionnow.jsp ke liye required method
    public static int doUpdateNowRecord(String instoriginal, String instmodified) {
        int status = 0;
        try {
            Connection con = Provider.getOracleConnection();
            String sql = "update instructiontable set instruction = ? where instruction = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, instmodified);
            ps.setString(2, instoriginal);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}