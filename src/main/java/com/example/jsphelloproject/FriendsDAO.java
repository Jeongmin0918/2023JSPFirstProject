package com.example.jsphelloproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.jsphelloproject.FriendsVO;
import com.example.jsphelloproject.JDBCUtil;

public class FriendsDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String friends_INSERT = "insert into friends (name, student_num, major, gender, age, hometown, dormitory, christian, birthday, season, img) values (?,?,?,?,?,?,?,?,?,?)";
    private final String friends_UPDATE = "update friends set name=?, student_num=?, major=?, gender=?, age=?, hometown=?, dormitory=?, christian=?, birthday=?, season=?, img=? where seq=?";
    private final String friends_DELETE = "delete from friends  where seq=?";
    private final String friends_GET = "select * from friends  where seq=?";
    private final String friends_LIST = "select * from friends order by seq desc";

    public int insertFriends(FriendsVO vo) {
        System.out.println("===> JDBC로 insertFriends() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(friends_INSERT);
            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getStudent_num());
            stmt.setString(3, vo.getMajor());
            stmt.setString(4, vo.getGender());
            stmt.setInt(5, vo.getAge());
            stmt.setString(6, vo.getHometown());
            stmt.setString(7, vo.getDormitory());
            stmt.setString(8, vo.getChristian());
            stmt.setString(9, vo.getBirthday());
            stmt.setString(10, vo.getSeason());
            stmt.setString(10, vo.getImg());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 글 삭제
    public void deleteFriends(FriendsVO vo) {
        System.out.println("===> JDBC로 deleteFriends() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(friends_DELETE);
            stmt.setInt(1, vo.getSeq());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
        public int updateFriends(FriendsVO vo) {
            System.out.println("===> JDBC로 updateFriends() 기능 처리");
            try {
                conn = JDBCUtil.getConnection();
                stmt = conn.prepareStatement(friends_UPDATE);
                stmt.setString(1, vo.getName());
                stmt.setString(2, vo.getStudent_num());
                stmt.setString(3, vo.getMajor());
                stmt.setString(4, vo.getGender());
                stmt.setInt(5, vo.getAge());
                stmt.setString(6, vo.getHometown());
                stmt.setString(7, vo.getDormitory());
                stmt.setString(8, vo.getChristian());
                stmt.setString(9, vo.getBirthday());
                stmt.setString(10, vo.getSeason());
                stmt.setString(11, vo.getImg());
                stmt.setInt(12, vo.getSeq());


            System.out.println(vo.getName() + "-" + vo.getStudent_num() + "-" + vo.getMajor() + "-"
                    + vo.getGender() + "-" + vo.getAge() + "-" + vo.getHometown() + "-" + vo.getDormitory() + "-"
                    + vo.getChristian() + "-" + vo.getBirthday() + "-" + vo.getSeason() + "-" + vo.getSeq());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public FriendsVO getFriends(int seq) {
        FriendsVO one = new FriendsVO();
        System.out.println("===> JDBC로 getFriends() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(friends_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setSeq(rs.getInt("seq"));
                one.setName(rs.getString("name"));
                one.setStudent_num(rs.getString("student_num"));
                one.setMajor(rs.getString("major"));
                one.setGender(rs.getString("gender"));
                one.setAge(rs.getInt("age"));
                one.setHometown(rs.getString("hometown"));
                one.setDormitory(rs.getString("dormitory"));
                one.setChristian(rs.getString("christian"));
                one.setBirthday(rs.getString("birthday"));
                one.setSeason(rs.getString("season"));
                one.setCnt(rs.getInt("cnt"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<FriendsVO> getFriendsList(){
        List<FriendsVO> list = new ArrayList<FriendsVO>();
        System.out.println("===> JDBC로 getFriendsList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(friends_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                FriendsVO one = new FriendsVO();
                one.setSeq(rs.getInt("seq"));
                one.setName(rs.getString("name"));
                one.setStudent_num(rs.getString("student_num"));
                one.setMajor(rs.getString("major"));
                one.setGender(rs.getString("gender"));
                one.setAge(rs.getInt("age"));
                one.setHometown(rs.getString("hometown"));
                one.setDormitory(rs.getString("dormitory"));
                one.setChristian(rs.getString("christian"));
                one.setBirthday(rs.getString("birthday"));
                one.setSeason(rs.getString("season"));
                one.setRegdate(rs.getDate("regdate"));
                one.setCnt(rs.getInt("cnt"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
