package com.kmj.board;

import com.kmj.board.BoardBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	// Data Access Object : DB 데이터 처리 객체
	// => DB에 관련된 모든 동작을 수행하는 객체
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	

	
	private Connection getConnection(){
		
		try {
			//Context 객체를 생성 (프로젝트 정보를 가지고있는객체)
			Context initCTX = new InitialContext();
		
			// DB연동 정보를 불러오기(context.xml)
			DataSource ds =
			(DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			
			conn = ds.getConnection();
			
			System.out.println(" 드라이버 로드, 디비연결 성공! ");
			System.out.println(conn);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void closeDB(){
		try {
			if(rs != null){ rs.close(); }
			if(pstmt != null){ pstmt.close();}
			if(conn != null){ conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	// insertBoard
	public void insertBoard(BoardBean bb){
		int num = 0;
		try {
			// 1 드라이버 로드
			// 2 디비 연결
			// => 한번에 처리 하는 메서드로 변경
			conn = getConnection();		
			
			// 3 sql (글번호를 계산하는 구문)
			sql = "select max(num) from board_kmj";

			pstmt = conn.prepareStatement(sql);
			
			// 4 sql 실행
			rs = pstmt.executeQuery();
			
			// 5 데이터 처리
			//  max(num) - sql 함수를 실행했을경우 커서이동 가능(데이터여부 상관없음)
			//  num     - sql 컬럼의 경우  커서 이동 불가능
			if(rs.next()){
				//num = rs.getInt("max(num)")+1;
				num = rs.getInt(1)+1;
			}
			
			System.out.println(" 글번호  : "+num);
			
			////////////////////////////////////////////////////
			
			// 3 sql 작성 (insert) & pstmt 객체 생성
			sql = "insert into board_kmj "
					+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			// ?
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getId());
			pstmt.setString(3, bb.getSubject());
			pstmt.setString(4, bb.getContent());
			pstmt.setInt(5, bb.getReadcount());
			pstmt.setInt(6, num); // re_ref에 글번호 num 저장
			pstmt.setInt(7, bb.getRe_lev());
			pstmt.setInt(8, bb.getRe_seq());
			pstmt.setString(9, bb.getFile());
			pstmt.setString(10, bb.getIp());
			
			// 4 sql 실행	
			
			pstmt.executeUpdate();
			
			System.out.println(" sql 구문 실행완료  : 글쓰기 완료! ");
			
		} catch (SQLException e) {
			System.out.println("디비 연결 실패!!");
			e.printStackTrace();
		} finally{
			// 자원해제 
			closeDB();
			
		}
		
	}
	// insertBoard()
	
	// getBoardCount()
		// 디비에 들어있는 글의 개수 계산후 리턴
		public int getBoardCount(){
			
	        int cnt = 0;
	        
	        try {
	        	// 1,2 드라이버로드, 디비연결
	        	conn = getConnection();
	        	
	        	// 3 sql 작성(select) & pstmt 객체 생성
	        	sql = "select count(*) from board_kmj";
				pstmt = conn.prepareStatement(sql);
				   
		        // 4 sql 실행
				rs = pstmt.executeQuery();
		        
		        // 5 데이터 처리
				if(rs.next()){
					cnt = rs.getInt(1);// "count(*)"
					//cnt = rs.getInt("count(*)");
				}
				
				System.out.println("SQL 구문 실행완료!");
				System.out.println(" 글 개수 : "+cnt+"개");
		        
			} catch (Exception e) {
				System.out.println(" 게시판 글개수_에러 발생!! ");
				e.printStackTrace();
			} finally{
			   // 자원해제
			   closeDB();
			}
			
			return cnt;
		}
		// getBoardCount()
		
		// getBoardList()
		public ArrayList getBoardList(){
			// DB데이터 1row 정보를 BoardBean 저장 -> ArrayList 한칸에 저장
			
			// 게시판의 글정보를 모두 저장하는 가변길이 배열
			ArrayList boardListAll = new ArrayList();
			
			// 게시판 글 1개의 정보를 저장하는 객체 
			BoardBean bb = null;
			//BoardBean bb = new BoardBean();
			
			
			try {
				// 1,2 드라이버로드, 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체 
				sql= "select * from board_kmj";
				pstmt = conn.prepareStatement(sql);
				
				// 4 sql 실행
				rs = pstmt.executeQuery();
				
				// 5 데이터처리 
				while(rs.next()){
					// 데이터 있을때 bb 객체 생성
					bb = new BoardBean();
					
					// DB정보 -> Bean 저장
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					bb.setId(rs.getString("id"));
					bb.setNum(rs.getInt("num"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setSubject(rs.getString("subject"));
					
					// Bean -> ArrayList 한칸에 저장
					boardListAll.add(bb);
					
				}//while 끝
				
				System.out.println(" 게시판 모든정보 저장완료! ");
				System.out.println(" 총 "+boardListAll.size()+"개");		
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}		
			
			return boardListAll;
		}
		// getBoardList()
		
		
		// getBoardList(startRow,pageSize)
		public ArrayList getBoardList(int startRow,int pageSize){
			// DB데이터 1row 정보를 BoardBean 저장 -> ArrayList 한칸에 저장
			
			// 게시판의 글정보를 원하는만큼 저장하는 가변길이 배열
			ArrayList boardList = new ArrayList();
			
			// 게시판 글 1개의 정보를 저장하는 객체 
			BoardBean bb = null;
			//BoardBean bb = new BoardBean();
			try {
				// 1,2 드라이버로드, 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체 
				//   글 정보 정렬 - order by
				//            - re_ref 값을 최신글 위쪽으로 정렬 (내림차순)
				//            - re_seq 값을 사용 (오름차순)
				//            - limit a,b   (a 시작행-1,b 개수)
				//            ex) 1번글 -> 0번 인덱스			
							
				sql= "select * from board_kmj "
						+ "order by re_ref desc, re_seq asc "
						+ "limit ?,?";			
				
				pstmt = conn.prepareStatement(sql);
				
				// ?
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);		
				
				// 4 sql 실행
				rs = pstmt.executeQuery();
				
				// 5 데이터처리 
				while(rs.next()){
					// 데이터 있을때 bb 객체 생성
					bb = new BoardBean();
					
					// DB정보 -> Bean 저장
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					bb.setId(rs.getString("id"));
					bb.setNum(rs.getInt("num"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setSubject(rs.getString("subject"));
					
					// Bean -> ArrayList 한칸에 저장
					boardList.add(bb);
					
				}//while 끝
				
				System.out.println(" 게시판 모든정보 저장완료! ");
				System.out.println(" 총 "+boardList.size()+"개");		
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}		
			
			return boardList;
		}
		// getBoardList(startRow,pageSize)
	
		
		// getBoard(num)
		public BoardBean getBoard(int num){
			BoardBean bb = null;
			try {
				
				conn = getConnection();
				
				sql = "select * from board_kmj where num=?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, num);
			
				rs = pstmt.executeQuery();
				
			
				if(rs.next()){
					bb = new BoardBean();
					
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					bb.setIp(rs.getString("ip"));
					bb.setId(rs.getString("id"));
					bb.setNum(rs.getInt("num"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_seq(rs.getInt("re_seq"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setSubject(rs.getString("subject"));
				}
				
				System.out.println(" 글번호에 해당하는 글정보 저장완료! ");
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return bb;
		}
		// getBoard(num)
	
	
	// updateBoard(bb)
	public void updateBoard(BoardBean bb) {

		try {
			// 1,2 디비연결
			conn = getConnection();

					// 3 sql (update-글수정) & pstmt 객체
					sql = "update board_kmj set subject=?,content=? where id=? and num=?";
					pstmt = conn.prepareStatement(sql);

					// ?
					pstmt.setString(1, bb.getSubject());
					pstmt.setString(2, bb.getContent());
					pstmt.setString(3, bb.getId());
					pstmt.setInt(4, bb.getNum());

					// 4 sql 실행
					pstmt.executeUpdate();

			System.out.println(" 글 수정 완료! 테스트" );
				} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

	}
	// updateBoard(bb)
	
	// updateFileBoard(bb)
	public void updateFileBoard(BoardBean bb) {

		try {
			// 1,2 디비연결
			conn = getConnection();

					// 3 sql (update-글수정) & pstmt 객체
					sql = "update board_kmj set subject=?,content=?,file=? where id=? and num=?";
					pstmt = conn.prepareStatement(sql);
					// ?
					pstmt.setString(1, bb.getSubject());
					pstmt.setString(2, bb.getContent());
					pstmt.setString(3, bb.getFile());
					pstmt.setString(4, bb.getId());
					pstmt.setInt(5,bb.getNum());

					// 4 sql 실행
					pstmt.executeUpdate();

			System.out.println(" 글 수정 완료! 테스트" );
				} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

	}	
	// updateFileBoard(bb)
	
	// deleteBoard(bb)
	public void deleteBoard(BoardBean bb,String id) {

		try {
			// 1,2 디비연결
			conn = getConnection();
			// 3 sql 생성(select) & pstmt 객체 생성
					sql = "delete from board_kmj where id=? and num=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, id);
					pstmt.setInt(2, bb.getNum());
					pstmt.executeUpdate();

			System.out.println(" 글 삭제 완료! " );

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// deleteBoard(bb)
		
		
		// reInsertBoard(bb)
		public void reInsertBoard(BoardBean bb){
			
			//1)답글 작성 번호(num)계산
			 //1,2디비연결
				conn = getConnection();
			 //3.sql구문 & pstmt객체
				sql="select max(num) from board_kmj";
				
				int num = 0;
				
				try {
					pstmt = conn.prepareStatement(sql);
			//4. sql실행
				rs = pstmt.executeQuery();
			//5. 데이터 처리		
				if(rs.next()){
					//rs.getInt("max(num)");
				num = rs.getInt(1)+1;
					
				}	
				
				System.out.println("답글 번호 계산 완료 : " +num);
				
					//2)답글 순서 재배치(정렬)
					//->re_ref(같은 그룹)안에서 re_seq(순서)를 정렬
					//						기존의 순서값보다 큰값이 있으면 순서를 1증가 
					sql = "update board_kmj set re_seq = re_seq+1 where re_ref=? and re_seq>?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, bb.getRe_ref());
					pstmt.setInt(2 ,bb.getRe_seq());
					
					//sql실행
					pstmt.executeUpdate();
					
					System.out.println("답글 정렬 완료!");
					
					//3)답글 쓰기
					sql ="insert into board_kmj(num,id,subject,content,"
							+ "readcount,re_ref,re_lev,re_seq,date,file,ip) "
							+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, num);
					pstmt.setString(2, bb.getId());
					pstmt.setString(3, bb.getSubject());
					pstmt.setString(4, bb.getContent());
					pstmt.setInt(5, bb.getReadcount());
					pstmt.setInt(6, bb.getRe_ref()); //re_ref(원글의 그룹번호 사용)
					pstmt.setInt(7, bb.getRe_lev() +1); //re_lev +1
					pstmt.setInt(8, bb.getRe_seq() +1); //re_seq +1
					pstmt.setString(9, bb.getFile());
					pstmt.setString(10, bb.getIp());
					
					
					//sql실행
					pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
			
			
		}
		// reInsertBoard(bb)
		
		// updateReadcount(num)
		public void updateReadcount(int num){
			
			try {
				//1,2 디비연결
				conn = getConnection();
				
				//3 sql 구문 작성(update) & pstmt 객체
				sql = "update board_kmj set readcount=readcount+1 "
						+ "where num=?";
				
				pstmt = conn.prepareStatement(sql);
				
				//?
				pstmt.setInt(1, num);
				
				//4 sql 실행
				pstmt.executeUpdate();
				
				System.out.println(" 글 조회수 증가 완료! ");			
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}
		// updateReadcount(num)
		
	
	
}//DAO