package com.kmj.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class userDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	private Connection getConnection() {
		try {
			// Context 객체를 생성 (프로젝트 정보를 가지고있는객체)
			Context initCTX = new InitialContext();

			// DB연동 정보를 불러오기(context.xml)
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");

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
	// getConnection() - 디비연결 끝

	// 자원해제코드 - finally 구문에서 사용
	public void closeDB() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// join
	public void join(userBean ub) {
		try {
			// 1,2디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			String sql = "insert into user_kmj values (?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			// ?
			pstmt.setString(1, ub.getId());
			pstmt.setString(2, ub.getPw());
			pstmt.setString(3, ub.getName());
			pstmt.setString(4, ub.getEmail());
			pstmt.setString(5, ub.getPhone());
			pstmt.setString(6, ub.getAddress());
			pstmt.setString(7, ub.getBirth());
			pstmt.setString(8, ub.getGender());
			pstmt.setTimestamp(9, ub.getRegdate());
			// 4 sql 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원해제
			closeDB();
			}
		}

	
	// join

	// login
	public int login(userBean ub) {
		int flag = -1;

		try {
			// 1,2디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			String sql = "select pw from project_kmj.user_kmj where id=?";

			pstmt = conn.prepareStatement(sql);
			// ?
			pstmt.setString(1, ub.getId());
			// 4 실행
			ResultSet rs = pstmt.executeQuery();
			// 5 데이터 처리
			if (rs.next()) {
				if (ub.getPw().equals(rs.getString("pw"))) {
					flag = 1;
				} else// 회원이지만 비번이 틀릴때
					flag = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원해제
				closeDB();
		}
		return flag;
	}
	// login

	// modify
	public int modify(userBean ub) {
		int flag = -1;
		try {
			// 1,2디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			String sql = "select pw from user_kmj where id=?";
			pstmt = conn.prepareStatement(sql);
			// ?
			pstmt.setString(1, ub.getId());
			// 4 실행
			ResultSet rs = pstmt.executeQuery();
			// 5 데이터 처리
			if (rs.next()) {
				// 아이디가 있는 경우
				if (ub.getPw().equals(rs.getString("pw"))) {
					flag = 1;
					// 비밀번호 같음 => 본인 -> 정보 수정
					// sql (update구문 & pstmt 객체) -> 둘이 세트임 꼭 같이 작성하기..
					sql = "update user_kmj set name=?, email=?, phone=?, address=?, birth=?, gender=? where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ub.getName());
					pstmt.setString(2, ub.getEmail());
					pstmt.setString(3, ub.getPhone());
					pstmt.setString(4, ub.getAddress());
					pstmt.setString(5, ub.getBirth());
					pstmt.setString(6, ub.getGender());
					pstmt.setString(7, ub.getId());

					pstmt.executeUpdate();
					System.out.println("정보가 수정되었습니다.");
				} else {
					flag = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원해제
			closeDB();

		}
		return flag;
	}
	// modify

	// delete
	public int delete(userBean ub) {
		int flag = -1;

		try {
			// 1,2 디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			// 4 sql 실행
			String sql = "select pw from user_kmj where id=?";
			pstmt = conn.prepareStatement(sql);
			// ?
			pstmt.setString(1, ub.getId());
			// 5 실행
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				if (ub.getPw().equals(rs.getString("pw"))) {
					flag = 1;
					sql = "delete from user_kmj where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ub.getId());
					pstmt.executeUpdate();

				} else {
					flag = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원해제
			closeDB();
		}
		return flag;
	}

	// delete
	
	//userList
	public ArrayList userList(){
		userBean ub = null;
		ArrayList arr = new ArrayList();
		try {
			// 1,2 디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			String sql = "select * from user_kmj";
			pstmt = conn.prepareStatement(sql);
			// 4 sql 실행
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString("id").equals("admin")){
					continue;
				}
				ub = new userBean();
				
				ub.setId(rs.getString("id"));
				ub.setPw(rs.getString("pw"));
				ub.setName(rs.getString("name"));
				ub.setEmail(rs.getString("email"));
				ub.setPhone(rs.getString("phone"));
				ub.setAddress(rs.getString("address"));
				ub.setBirth(rs.getString("birth"));
				ub.setGender(rs.getString("gender"));
				ub.setRegdate(rs.getTimestamp("regdate"));
				
				arr.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원해제
			closeDB();
		}
		return arr;
		
	}
	//userList
	
	//userInfo
	
	public userBean userInfo(String id){
		userBean ub = null;
		
		try {
			// 1,2 디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			sql = "select * from user_kmj where id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 
			pstmt.setString(1,id);
			// 4 sql객체 실행 -> rs에 저장
			rs = pstmt.executeQuery();
			// 5 데이터 처리 (화면에 출력)
			if(rs.next()){
				ub = new userBean();
				ub.setId(rs.getString("id"));
				ub.setPw(rs.getString("pw"));
				ub.setName(rs.getString("name"));
				ub.setEmail(rs.getString("email"));
				ub.setPhone(rs.getString("phone"));
				ub.setAddress(rs.getString("address"));
				ub.setBirth(rs.getString("birth"));
				ub.setGender(rs.getString("gender"));
				ub.setRegdate(rs.getTimestamp("regdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//자원해제
			closeDB();
		}
		return ub;
		
	}
	//userInfo
	

	// idCheck(id)
	public int idCheck(String id) {
		int flag = 0;
		try {
			// 1,2 디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			sql = "select * from user_kmj where id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			// 4 sql 실행
			rs = pstmt.executeQuery();
			// 5 데이터처리

			if (rs.next()) {
				flag = 1; // 이미 사용중인 아이디
			} else {
				flag = 0; // 사용가능한 아이디
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return flag;
	}
	// idCheck(id)

	// emailCheck(email)
	public int emailCheck(String email) {
		int flag = 0;
		try {
			// 1,2 디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			sql = "select * from user_kmj where email=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);
			// 4 sql 실행
			rs = pstmt.executeQuery();
			// 5 데이터처리

			if (rs.next()) {
				flag = 1; // 회원이 있음 -> 해당아이디 X
			} else {
				flag = 0; // 회원이 없음 -> 해당아이디 O
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return flag;
	}

	// email(email)
	public void email(userBean ub) {

		try {
			// 1,2 디비연결
			conn = getConnection();
			// 3 sql구문 & pstmt객체 생성
			sql = "select email from user_kmj where id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, ub.getId());
			// 4 sql 실행
			rs = pstmt.executeQuery();
			// 5 데이터처리

			if (rs.next()) {
				ub.setEmail(rs.getString("email"));
			} else {
				ub.setEmail("");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
}
// email 문의보내기
