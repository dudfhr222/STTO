package DBBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import Bean.BoardBean;
import Bean.GroupBean;
import Bean.MemberBean;

public class groupPageDBBean {
    private static groupPageDBBean instance = new groupPageDBBean();

    public static groupPageDBBean getInstance() {
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

    //groupframe-44
    public int valNumCheck(String mem_id, int gr_mem_gnum) {
        int check = 0;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select gr_mem_number from groupmemberboard where gr_mem_gnum =? and mem_id =?";

        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, gr_mem_gnum);
            pstm.setString(2, mem_id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                check = rs.getInt("gr_mem_number"); //작성 했음
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pstm, rs);
        }
        return check;
    }

    //groupframe-45
    public ArrayList<GroupBean> memlist(int gr_mem_gnum) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select  gr_mem_gnum, mem_id, gr_mem_number,  gr_mem_name, group_startdate, group_finishdate, mem_email, group_introduce " +
                "from groupmemberboard where gr_mem_gnum =? order by gr_mem_number asc";
        ArrayList<GroupBean> list = new ArrayList<>();

        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, gr_mem_gnum);
            rs = pstm.executeQuery();
            //groupboard 그룹번호, 이름 set

            while (rs.next()) {
                GroupBean gb = new GroupBean();
                gb.setGr_mem_gnum(rs.getInt("gr_mem_gnum"));
                gb.setMem_id(rs.getString("mem_id"));
                gb.setGr_mem_number(rs.getInt("gr_mem_number"));
                gb.setGr_mem_name(rs.getString("gr_mem_name"));
                gb.setGroup_startdate(rs.getString("group_startdate"));
                gb.setGroup_finishdate(rs.getString("group_finishdate"));
                gb.setMem_email(rs.getString("mem_email"));
                gb.setGroup_introduce(rs.getString("group_introduce"));
                list.add(gb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pstm, rs);
        }
        return list;
    }

    //groupframe - 48
    public BoardBean getBInfo(int gr_mem_gnum) {
        BoardBean bb = new BoardBean();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "";

        try {
            conn = getConnection();
            sql = "select * from boards where b_group=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, gr_mem_gnum);
            rs = pstm.executeQuery();

            if (rs.next()) {
                bb.setB_group(rs.getInt("b_group"));
                bb.setB_goal(rs.getString("b_goal"));
                bb.setB_title(rs.getString("b_title"));
                bb.setB_startdate(rs.getString("b_startdate"));
                bb.setB_finishdate(rs.getString("b_finishdate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pstm, rs);
        }
        return bb;
    }

    //confirm -38
    public ArrayList<GroupBean> contentList(int gr_mem_gnum, String gr_mem_name) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select gr_mem_number, gr_mem_gnum, gr_mem_name, gr_mem_study, gr_mem_conid, gr_mem_date, gr_check from groupboard " +
                "where gr_mem_name=? and gr_mem_gnum =? order by gr_mem_date asc";
        ArrayList<GroupBean> list = new ArrayList<>();
        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, gr_mem_name);
            pstm.setInt(2, gr_mem_gnum);
            rs = pstm.executeQuery();

            while (rs.next()) {
                GroupBean gb = new GroupBean();
                gb.setGr_mem_number(rs.getInt(1));
                gb.setGr_mem_gnum(rs.getInt(2));
                gb.setGr_mem_name(rs.getString(3));
                gb.setGr_mem_study(rs.getString(4));
                gb.setGr_mem_conid(rs.getInt(5));
                gb.setGr_mem_date(rs.getString(6));
                gb.setGr_check(rs.getInt(7));
                list.add(gb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pstm, rs);
        }
        return list;
    }

    //input_process -22
    public int valcheck(String gr_mem_name, String gr_mem_date) {
        int check = 0;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "select gr_mem_study from groupboard where gr_mem_name=? and gr_mem_date=?";
        try {
            conn = getConnection();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, gr_mem_name);
            pstm.setString(2, gr_mem_date);
            rs = pstm.executeQuery();
            if (rs.next()) {
                check = 1; //작성 했음
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pstm, rs);
        }
        return check;
    }

    //input_process -33
    public int insertRecord(GroupBean gb, int gr_mem_gnum) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "";

        gr_mem_gnum = gb.getGr_mem_gnum(); //그룹 번호
        int gr_mem_number = gb.getGr_mem_number(); //개인 번호
        String gr_mem_date = gb.getGr_mem_date(); //오늘 날짜
        String gr_mem_name = gb.getGr_mem_name(); //이름
        String gr_mem_study = gb.getGr_mem_study(); //작성 내용
        int gr_mem_conid = gb.getGr_mem_conid(); //작성 글 번호

        int gr_check = 1;
        int count = 0;
        int re = -1;

        try {
            conn = getConnection();
            pstm = conn.prepareStatement("select max(gr_mem_conid) from groupboard where gr_mem_name =?");
            pstm.setString(1, gr_mem_name);
            rs = pstm.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1) + 1;
            } else {
                count = 1;
            }

            sql = "insert into groupboard(gr_mem_number, gr_mem_gnum, gr_mem_name, gr_mem_study, gr_mem_conid, gr_mem_date, gr_check) "
                    + "values(?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, gr_mem_number);
            pstm.setInt(2, gr_mem_gnum);
            pstm.setString(3, gr_mem_name);
            pstm.setString(4, gr_mem_study);
            pstm.setInt(5, count);
            pstm.setString(6, gr_mem_date);
            pstm.setInt(7, gr_check);
            pstm.executeUpdate();

            gb.setGr_check(gr_check);
            re = 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pstm, rs);
        }
        return re;
    }

    //edit -35
    public GroupBean getRecord(String gr_mem_name, int gr_mem_conid) throws Exception {
        GroupBean gb = new GroupBean();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "";

        try {
            conn = getConnection();
            sql = "select * from groupboard where gr_mem_name=? and gr_mem_conid =?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, gr_mem_name);
            pstm.setInt(2, gr_mem_conid);
            rs = pstm.executeQuery();

            if (rs.next()) {
                gb.setGr_mem_number(rs.getInt("gr_mem_number"));
                gb.setGr_mem_gnum(rs.getInt("gr_mem_gnum"));
                gb.setGr_mem_name(rs.getString("gr_mem_name"));
                gb.setGr_mem_study(rs.getString("gr_mem_study"));
                gb.setGr_mem_conid(rs.getInt("gr_mem_conid"));
                gb.setGr_mem_date(rs.getString("gr_mem_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn,pstm,rs);
        }
        return gb;
    }

    // edit_process -29
    public int editBoard(String gr_mem_study, int gr_mem_gnum, String gr_mem_name, int gr_mem_conid){
        Connection conn = null;
        PreparedStatement pstm = null;
        int re = -1;
        try {
            conn = getConnection();
            pstm = conn.prepareStatement("update groupboard set gr_mem_study=? where gr_mem_gnum=? and gr_mem_name=? and gr_mem_conid=?");
            pstm.setString(1, gr_mem_study);
            pstm.setInt(2, gr_mem_gnum);
            pstm.setString(3, gr_mem_name);
            pstm.setInt(4, gr_mem_conid);
            pstm.executeUpdate();
            re = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn,pstm);
        }
        return re;
    }

    //개인 정보 뽑아내기
    public MemberBean getPrec(int gr_mem_gnum, int gr_mem_number){
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "";
        MemberBean mb = new MemberBean();

        try {
            conn = getConnection();
            sql = "select a.mem_id, a.mem_name, a.mem_interests, a.mem_introduce from stmembers a, (select mem_id from groupmemberboard where gr_mem_number=? and gr_mem_gnum=?) b where a.mem_id = b.mem_id";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, gr_mem_number);
            pstm.setInt(2, gr_mem_gnum);
            rs = pstm.executeQuery();

            if (rs.next()) {
                mb.setMem_id(rs.getString("mem_id"));
                mb.setMem_name(rs.getString("mem_name"));
                mb.setMem_interests(rs.getString("mem_interests"));
                mb.setMem_introduce(rs.getString("mem_introduce"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           close(conn,pstm,rs);
        }
        return mb;
    }
}
