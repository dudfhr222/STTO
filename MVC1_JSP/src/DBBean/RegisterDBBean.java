package DBBean;

import Bean.RegisterBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterDBBean {
    //DBBean 기본 세팅
    private static RegisterDBBean instance = new RegisterDBBean();
    public static RegisterDBBean getInstance(){
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
    //게시글에서 신청하기 눌러 등록하는 프로세스
    public int getRequest(String b_id, String b_title, int b_group, String mem_id, String mem_name) throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        String sql = "";
        int re = -1;

        try {
            conn = getConnection();

            pstm = conn.prepareStatement("select * from grouprequest where b_group=? and mem_id=?");
            pstm.setInt(1, b_group);
            pstm.setString(2, mem_id);
            rs = pstm.executeQuery();
            if (!rs.next()) {
                pstm = conn.prepareStatement("select count(b_group) from grouprequest");
                rs = pstm.executeQuery();

                if (rs.next()) {
                    count = rs.getInt(1) + 1;
                } else {
                    count = 1;
                }

                sql = "insert into grouprequest(mem_name, mem_id, b_title, b_id, b_gmember, b_group) "
                        + "values(?,?,?,?,?,?)";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, mem_name);
                pstm.setString(2, mem_id);
                pstm.setString(3, b_title);
                pstm.setString(4, b_id);
                pstm.setInt(5, count);
                pstm.setInt(6, b_group);

                pstm.executeUpdate();
                re = 1;
                System.out.println("신청 완료");
            }
        } catch (Exception e) {
            System.out.println("오류 발생");
            e.printStackTrace();
        }finally {
            close(conn,pstm,rs);
        }
        return re;
    }

    //마이페이지 신청 승인 로직
    public RegisterBean getRecord(String b_id, int b_group) throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        RegisterBean rb = new RegisterBean();

        try{
            conn = getConnection();
            String sql = "select b_group, b_goal, b_dday, b_startdate, b_finishdate from boards where b_id =? and b_group = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, b_id);
            pstm.setInt(2, b_group);
            rs = pstm.executeQuery();

            if(rs.next()){
                rb.setGr_mem_gnum(rs.getInt("b_group"));
                rb.setGroup_goal(rs.getString("b_goal"));
                rb.setGroup_studydate(rs.getString("b_dday"));
                rb.setGroup_startdate(rs.getString("b_startdate"));
                rb.setGroup_finishdate(rs.getString("b_finishdate"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            close(conn, pstm, rs);
        }
        return rb;
    }

    public RegisterBean getInfo(String [] mem_name, String [] mem_id, int count) throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        RegisterBean rb = new RegisterBean();

        try{
            conn = getConnection();
            String sql = "select b_group, b_goal, b_dday, b_startdate, b_finishdate from boards where b_id =? and b_group = ?";
            pstm = conn.prepareStatement(sql);
            ////pstm.setString(1, b_id);
            //pstm.setInt(2, b_group);
            rs = pstm.executeQuery();

            if(rs.next()){
                rb.setGr_mem_gnum(rs.getInt("b_group"));
                rb.setGroup_goal(rs.getString("b_goal"));
                rb.setGroup_studydate(rs.getString("b_dday"));
                rb.setGroup_startdate(rs.getString("b_startdate"));
                rb.setGroup_finishdate(rs.getString("b_finishdate"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
           close(conn,pstm,rs);
        }
        return rb;
    }

    //모집완료 친구들
    //현재 인원 늘리기
    public int updateStatus(int b_group, String b_id, int b_stmember, int b_status) {
        Connection conn = null;
        PreparedStatement pstm = null;
        int re = -1;

        try{
            conn = getConnection();
            if(b_stmember != b_status) {
                pstm = conn.prepareStatement("update boards set b_status = b_status + 1 where b_group =? and b_id =?");
                pstm.setInt(1, b_group);
                pstm.setString(2, b_id);
                pstm.executeQuery();
                re = 1;
            }else {
                re = -1;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            close(conn, pstm);
        }
        return re;
    }
    //번호 부여할라고 사용 -> gr_mem_number 부여
    public int numTemp(int b_group) throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int num = -1;

        try{
            conn = getConnection();
            pstm = conn.prepareStatement("select b_status from boards where b_group=?");
            pstm.setInt(1, b_group);
            rs = pstm.executeQuery();
            if(rs.next()) {
                num = rs.getInt("b_status");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            close(conn,pstm,rs);
        }
        return num;
    }

    //신청한 친구 정보 임시 테이블로 옮기기
    public int memTemp(int gr_mem_number, int b_group, String mem_id, String b_id) throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        int re = -1;

        try {
            conn = getConnection();
            //각 인원들 임시 테이블로 이동
            String sql = "insert into memtemp " +
                    "(gr_mem_gnum, mem_id, gr_mem_number, gr_mem_name, mem_email, group_goal, " +
                    "group_startdate, group_finishdate, group_interests, group_report, group_introduce) " +
                    "select " +
                    "b.b_group, a.mem_id, ?, " +
                    "a.mem_name, a.mem_email, b.b_goal, " +
                    "b.b_startdate, b.b_finishdate, b.b_interests, " +
                    "a.mem_report, a.mem_introduce " +
                    "from stmembers a, boards b " +
                    "where a.mem_id = ?" +
                    "and b.b_group = ? and b.b_id = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, gr_mem_number);
            pstm.setString(2, mem_id);
            pstm.setInt(3, b_group);
            pstm.setString(4, b_id);
            pstm.executeUpdate();
            re = 1;

            System.out.println("등록 완료");
        }catch(Exception e) {
            System.out.println("등록 실패");
            e.printStackTrace();
        }finally {
            close(conn,pstm);
        }
        return re;
    }

    public int upToGroupMemberBoard(int b_group) {
        Connection conn = null;
        PreparedStatement pstm = null;
        int re = -1;

        try {
            conn = getConnection();
            //인원 전부 다 보내기
            String sql =	"insert into groupmemberboard " +
                    "select * from memtemp where gr_mem_gnum=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, b_group);
            pstm.executeUpdate();
            re = 1;

            System.out.println("복사 완료");
        }catch(Exception e) {
            System.out.println("응 안넘어가");
            e.printStackTrace();
        }finally {
            close(conn,pstm);
        }
        return re;
    }

    public int goodByeFellows(int b_group) {
        Connection conn = null;
        PreparedStatement pstm = null;
        int re = -1;

        try {
            conn = getConnection();
            pstm = conn.prepareStatement("delete from memtemp where gr_mem_gnum=?");
            pstm.setInt(1, b_group);
            pstm.executeUpdate();
            re = 1;

            System.out.println("최종 등록 완료");
        }catch(Exception e) {
            System.out.println("최종 등록 실패");
            e.printStackTrace();
        }finally {
            close(conn, pstm);
        }
        return re;
    }
}
