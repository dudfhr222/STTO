package DBBean;

import Bean.BoardBean;
import Bean.GroupBean;
import Bean.GroupRegisterBean;
import Bean.MemberBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDBBean {
    //DBBean 기본 설정
    private static MemberDBBean instance = new MemberDBBean();
    private void setmem(ResultSet rs, MemberBean member) throws SQLException {
        member.setMem_num(rs.getInt("mem_num"));
        member.setMem_id(rs.getString("mem_id"));
        member.setMem_pw(rs.getString("mem_pw"));
        member.setMem_name(rs.getString("mem_name"));
        member.setMem_jumin(rs.getString("mem_jumin"));
        member.setMem_tel(rs.getString("mem_tel"));
        member.setMem_email(rs.getString("mem_email"));
        member.setMem_interests(rs.getString("mem_interests"));
        member.setMem_introduce(rs.getString("mem_introduce"));
        member.setMem_report(rs.getInt("mem_report"));
    }

    public static MemberDBBean getInstance() {
        return instance;
    }

    public Connection getConnection() throws Exception {

        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    public void close(Connection conn, PreparedStatement pstm, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        close(conn, pstm);
    }

    public void close(Connection conn, PreparedStatement pstm) {
        if (pstm != null) {
            try {
                pstm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    static void myListInfo(ResultSet rs, BoardBean bb) throws SQLException {
        bb.setB_id(rs.getString("b_id"));
        bb.setB_title(rs.getString("b_title"));
        bb.setB_content(rs.getString("b_content"));
        bb.setB_startdate(rs.getString("b_startdate"));
        bb.setB_finishdate(rs.getString("b_finishdate"));
        bb.setB_stmember(rs.getInt("b_stmember"));
    }

    //loginOk -15
    public int userCheck(String id, String pw) throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int re = -1;
        String sql = "select mem_pw from STMEMBERS where mem_id=?";
        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                String db_mem_pw = rs.getString("mem_pw");
                if (db_mem_pw.equals(pw)) {
                    re = 1;
                }else {
                    re = 0;
                }
            }else {
                re = -1;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn,pstm,rs);
        }
        return re;
    }
    //loginOk -16
    //Method Refactoring
    //void로 해보기
    public MemberBean getMember(String mem_id) throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select * from STMEMBERS where mem_id=?";
        MemberBean member = null;
        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, mem_id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                 member = new MemberBean();
                setmem(rs, member);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn, pstm,rs);
        }
        return member;
    }

    //registerOk -16
    public int confirmID(String id) throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select mem_id from STMEMBERS where mem_id =?";
        int re= -1;

        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            if(rs.next()) {
                re = 1;
            }
            else {
                re = 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn,pstm,rs);
        }
        return re;
    }
    //회원 테이블에 등록
    public int insertMember(MemberBean Member) throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        String sql = "insert into STMEMBERS values(STUDY_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)";
        int re = -1;

        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, Member.getMem_id());
            pstm.setString(2, Member.getMem_pw());
            pstm.setString(3, Member.getMem_name());
            pstm.setString(4, Member.getMem_jumin());
            pstm.setString(5, Member.getMem_tel());
            pstm.setString(6, Member.getMem_email());
            pstm.setString(7, Member.getMem_interests());
            pstm.setString(8, Member.getMem_introduce());
            pstm.setInt(9, Member.getMem_report());
            pstm.executeUpdate();
            re = 1;

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                close(conn, pstm);
            }
        return re;
    }

    //내가 참여중인 스터디 정보 내보냄
    public ArrayList<GroupBean> getMyStudyInfo(String mem_id) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select gr_mem_gnum, group_goal, group_startdate, group_finishdate, group_interests, group_introduce from groupmemberboard where mem_id = ?";
        ArrayList<GroupBean> list = new ArrayList<GroupBean>();
        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, mem_id);
            rs = pstm.executeQuery();

            while (rs.next()) {
                GroupBean gb = new GroupBean();
                gb.setGr_mem_gnum(rs.getInt(1));
                gb.setGroup_goal(rs.getString(2));
                gb.setGroup_startdate(rs.getString(3));
                gb.setGroup_finishdate(rs.getString(4));
                gb.setGroup_interests(rs.getString(5));
                gb.setGroup_introduce(rs.getString(6));
                list.add(gb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn,pstm,rs);
        }
        return list;
    }

    public MemberBean getUserInfo(String id) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        MemberBean member = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM STMEMBERS WHERE MEM_ID=?");

            conn = getConnection();
            pstm = conn.prepareStatement(query.toString());
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                member = new MemberBean();
                member.setMem_num(rs.getInt("mem_num"));
                member.setMem_id(rs.getString("mem_id"));
                member.setMem_pw(rs.getString("mem_pw"));
                member.setMem_name(rs.getString("mem_name"));
                member.setMem_tel(rs.getString("mem_tel"));
                member.setMem_email(rs.getString("mem_email"));
                member.setMem_interests(rs.getString("mem_interests"));
                member.setMem_introduce(rs.getString("mem_introduce"));
                member.setMem_report(rs.getInt("mem_report"));
            }
            return member;
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            close(conn,pstm,rs);
        }
    }

    public int updateMember(MemberBean member) throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        int re = -1;

        String sql = "update STMEMBERS set mem_pw=?, mem_tel=?, mem_interests=?, mem_introduce where mem_id=?";

        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, member.getMem_pw());
            pstm.setString(2, member.getMem_tel());
            pstm.setString(3, member.getMem_interests());
            pstm.setString(4, member.getMem_introduce());
            pstm.setString(5, member.getMem_id());
            re = pstm.executeUpdate();

            System.out.println("수정 완료 했습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("수정 실패했습니다.");
        }finally {
            close(conn,pstm);
        }
        return re;
    }

    public ArrayList<BoardBean> myList(String mem_id) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select * from boards where b_id = ? order by b_group asc";
        ArrayList<BoardBean> list = new ArrayList<>();
        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, mem_id);
            rs = pstm.executeQuery();

            while (rs.next()) {
                BoardBean bb = new BoardBean();
                myListInfo(rs, bb);

                bb.setInterests(rs.getString("b_interests"));
                bb.setB_goal(rs.getString("b_goal"));
                bb.setB_status(rs.getInt("b_status"));
                bb.setB_group(rs.getInt("b_group"));
                bb.setB_gmember(rs.getInt("b_gmember"));
                list.add(bb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn,pstm,rs);
        }
        return list;
    }

    public ArrayList<GroupRegisterBean> reqList(String mem_id, int b_group) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<GroupRegisterBean> list = new ArrayList<>();
        try {
            conn = getConnection();
            pstm = conn.prepareStatement("select * from grouprequest where b_id = ? order by b_group asc, b_gmember asc");
            pstm.setString(1, mem_id);
            rs = pstm.executeQuery();

            while (rs.next()) {
                GroupRegisterBean grb = new GroupRegisterBean();
                grb.setMem_name(rs.getString(1));
                grb.setMem_id(rs.getString(2));
                grb.setB_title(rs.getString(3));
                grb.setB_id(rs.getString(4));
                grb.setB_gmember(rs.getInt(5));
                grb.setB_group(rs.getInt(6));
                list.add(grb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn,pstm,rs);
        }
        return list;
    }
    public int deleteList(GroupRegisterBean grb){
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int re = -1;

        String sql = "delete from grouprequest where b_group=? and mem_id=?";

        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, grb.getB_group());
            pstm.setString(2, grb.getMem_id());
            re = pstm.executeUpdate();

            System.out.println("삭제 완료");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("삭제 실패");
        }finally {
            close(conn,pstm,rs);
        }
        return re;
    }

    public MemberBean getKey(String b_id, int b_group){
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        MemberBean member = new MemberBean();
        try {
            conn = getConnection();
            pstm = conn.prepareStatement("select * from boards where b_id=? and b_group=?");
            pstm.setString(1, b_id);
            pstm.setInt(1, b_group);
            rs = pstm.executeQuery();

            if (rs.next()) {
                setmem(rs, member);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn,pstm,rs);
        }
        return member;
    }
}
