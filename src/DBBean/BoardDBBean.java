package DBBean;

import Bean.BoardBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	//DBBean 기본 세팅
	private static BoardDBBean instance = new BoardDBBean();

	public static BoardDBBean getInstance() {
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
	//boardWriteProc.jsp에서 작성 글 등록 프로세스 처리
	public int insertBoard(BoardBean board) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		int count = 0;
		try {
			conn = getConnection();
			pstm = conn.prepareStatement("select max(b_group) from boards");
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1)+1;
			}else {
				count = 1;
			}
			sql = "insert into boards(b_id, b_number, b_stmember, b_startdate, b_finishdate, "
					+ "b_title, b_goal, b_content, b_interests, b_area, B_LANGUAGE, B_INTER_CH, b_status, b_group) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, board.getB_id());
			pstm.setInt(2, count);
			pstm.setInt(3, board.getB_stmember());
			pstm.setString(4, board.getB_startdate());
			pstm.setString(5, board.getB_finishdate());
			pstm.setString(6, board.getB_title());
			pstm.setString(7, board.getB_goal());
			pstm.setString(8, board.getB_content());
			pstm.setString(9, board.getInterests());
			pstm.setString(10, board.getArea());
			pstm.setString(11, board.getLanguages());
			pstm.setString(12, board.getB_inter_c());
			pstm.setInt(13, 1);
			pstm.setInt(14, count);
			pstm.executeUpdate();
			re = 1;
			
			if(re == 1) {
				sql = "insert into memtemp " + 
						"(gr_mem_gnum, mem_id, gr_mem_number, gr_mem_name, mem_email, group_goal, " + 
						"group_startdate, group_finishdate, group_interests, group_report, group_introduce) " + 
						"select " + 
						"b.b_group, a.mem_id, ?, " + 
						"a.mem_name, a.mem_email, b.b_goal, " + 
						"b.b_startdate, b.b_finishdate, b.b_interests, " + 
						"a.mem_report, a.mem_introduce " + 
						"from stmembers a, boards b " + 
						"where a.mem_id = b.b_id " + 
						"and a.mem_id = ? and b.b_title= ?";
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1, 1);
				pstm.setString(2, board.getB_id());
				pstm.setString(3, board.getB_title());
				pstm.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close(conn,pstm,rs);
		}
		return re;
	}

	public ArrayList<BoardBean> listBoard(String b_area, String b_inter_s, String b_inter_c){
		//ResultSet pageSet=null;
		Connection conn=null;
		PreparedStatement pstm = null;
		ResultSet rs=null;
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		try {
			conn = getConnection();
			if(b_area == null && b_inter_s == null && b_inter_c== null) {
				pstm = conn.prepareStatement("select * from boards where b_status != b_stmember order by b_group asc");
				rs = pstm.executeQuery();

				while(rs.next()) {
					BoardBean bb = new BoardBean();
					bb.setB_group(rs.getInt("b_group"));
					MemberDBBean.myListInfo(rs, bb);
					bb.setB_status(rs.getInt("b_status"));
					bb.setInterests(rs.getString("b_interests"));
					bb.setB_goal(rs.getString("b_goal"));
					bb.setArea(rs.getString("b_area"));
					bb.setLanguages(rs.getString("b_language"));
					bb.setB_inter_c(rs.getString("b_inter_ch"));
					
					boardList.add(bb);
				}
			}else if(b_area.equals("지역") && b_inter_s.equals("개발분야") && b_inter_c.equals("언어")) {
				pstm = conn.prepareStatement("select * from boards where b_status != b_stmember order by b_group asc");
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					BoardBean bb = new BoardBean();
					bb.setB_group(rs.getInt("b_group"));
					MemberDBBean.myListInfo(rs, bb);
					bb.setB_status(rs.getInt("b_status"));
					bb.setInterests(rs.getString("b_interests"));
					bb.setB_goal(rs.getString("b_goal"));
					bb.setArea(rs.getString("b_area"));
					bb.setLanguages(rs.getString("b_language"));
					bb.setB_inter_c(rs.getString("b_inter_ch"));

					boardList.add(bb);
				}
			}else {
				pstm = conn.prepareStatement("select * from boards where b_area=? and b_language=? and b_inter_ch=? and where b_status != b_stmember order by b_group asc");
				pstm.setString(1, b_area); //지역
				pstm.setString(2, b_inter_c); //언어 => b_language
				pstm.setString(3, b_inter_s); //분야 => b_inter_ch
				rs = pstm.executeQuery();

				while(rs.next()) {
					BoardBean bb = new BoardBean();
					bb.setB_group(rs.getInt("b_group"));
					MemberDBBean.myListInfo(rs, bb);
					bb.setB_status(rs.getInt("b_status"));
					bb.setInterests(rs.getString("b_interests"));
					bb.setB_goal(rs.getString("b_goal"));
					bb.setArea(rs.getString("b_area"));
					bb.setLanguages(rs.getString("b_language"));
					bb.setB_inter_c(rs.getString("b_inter_ch"));
					
					boardList.add(bb);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,pstm,rs);
		}
		return boardList;
	}
	
	public BoardBean getConInfo(int b_group) { // bnum : 게시글번호
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="select * from boards where b_group=?";
		BoardBean bb = null;
		
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, b_group);
			rs = pstm.executeQuery();
			
			if (rs.next()) {
				bb = new BoardBean();
				bb.setB_group(rs.getInt("b_group"));
				MemberDBBean.myListInfo(rs, bb);
				bb.setB_status(rs.getInt("b_status"));
				bb.setInterests(rs.getString("b_interests"));
				bb.setB_goal(rs.getString("b_goal"));
				bb.setArea(rs.getString("b_area"));
				bb.setLanguages(rs.getString("b_language"));
				bb.setB_inter_c(rs.getString("b_inter_ch"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstm, rs);
		}
		return bb;
	}
	

	public int setNumber(BoardBean board) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;

		try {
			conn = getConnection();
			sql = "select b_id, b_status from boards where b_id=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, board.getB_id());
			pstm.setInt(2, board.getB_status());
			rs = pstm.executeQuery();

			if (rs.next()) {
				String id = rs.getString(1);
				int status = rs.getInt(2);
				if (id.equals(board.getB_id()) && status == 1) {
					sql = "update b_group, b_gmember set b_group=b_group+1 and "
							+ "b_gmember=b_member+1 from boards where b_id=?";
					pstm = conn.prepareStatement(sql);
					pstm.setInt(1, board.getB_group());
					pstm.setInt(2, board.getB_gmember());
					pstm.executeUpdate();
					re = 1;
				} else {
					re = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn,pstm,rs);
		}

		return re;
	}

	public int setStatus(BoardBean board) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;

		try {
			conn = getConnection();
			sql = "select b_id from boards where b_id=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, board.getB_id());

			rs = pstm.executeQuery();

			if (rs.next()) {
				String id = rs.getString(1);
				if (id.equals(board.getB_id())) {
					sql = "update b_status set b_status=1 from boards where b_id=?";
					pstm = conn.prepareStatement(sql);
					pstm.setInt(1, board.getB_status());
					pstm.executeUpdate();
					re = 1;
				} else {
					re = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn,pstm,rs);
		}
		return re;
	}
}
