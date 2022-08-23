package com.mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Mem_JDBCDAO implements Mem_DAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/lonelybar?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "208127";

	private static final String INSERT_STMT = 
			"INSERT INTO mem (mem_account, mem_password, mem_gender, mem_last_name, "
			+ "mem_first_name, mem_nickname, mem_tel_no, mem_cel_no, mem_email, mem_id, mem_birth,"
			+ " mem_addr, mem_permission, status, mem_build_time, mem_cert_status)"
			+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT mem_no, mem_account, mem_password, mem_gender, mem_last_name, mem_first_name,"
			+ " mem_nickname, mem_tel_no, mem_cel_no, mem_email, mem_id, mem_birth, mem_addr,"
			+ " mem_permission, status, mem_build_time, mem_cert_status FROM mem order by mem_no";
		private static final String GET_ONE_STMT = 
			"SELECT mem_no, mem_account, mem_password, mem_gender, mem_last_name, mem_first_name,"
			+ " mem_nickname, mem_tel_no, mem_cel_no, mem_email, mem_id, mem_birth, mem_addr,"
			+ " mem_permission, status, mem_build_time, mem_cert_status FROM mem where mem_no = ?";
		private static final String DELETE = 
			"DELETE FROM mem where mem_no = ?";
		private static final String UPDATE = 
			"UPDATE mem set mem_account=?, mem_password=?, mem_gender=?, mem_last_name=?, mem_first_name=?,"
			+ " mem_nickname=?, mem_tel_no=?, mem_cel_no=?, mem_email=?, mem_id=?, mem_birth=?, mem_addr=?, mem_permission=?,"
			+ " status=?, mem_build_time=?, mem_cert_status=? where mem_no = ?";

	@Override
	public void insert(Mem_VO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memVO.getMem_account());
			pstmt.setString(2, memVO.getMem_password());
			pstmt.setInt(3, memVO.getMem_gender());
			pstmt.setString(4, memVO.getMem_last_name());
			pstmt.setString(5, memVO.getMem_first_name());
			pstmt.setString(6, memVO.getMem_nickname());
			pstmt.setString(7, memVO.getMem_tel_no());
			pstmt.setString(8, memVO.getMem_cel_no());
			pstmt.setString(9, memVO.getMem_email());
			pstmt.setString(10, memVO.getMem_id());
			pstmt.setDate(11, memVO.getMem_birth());
			pstmt.setString(12, memVO.getMem_addr());
			pstmt.setInt(13, memVO.getMem_permission());
			pstmt.setInt(14, memVO.getStatus());
			pstmt.setTimestamp(15, memVO.getMem_build_time());
			pstmt.setInt(16, memVO.getMem_cert_status());





			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(Mem_VO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memVO.getMem_account());
			pstmt.setString(2, memVO.getMem_password());
			pstmt.setInt(3, memVO.getMem_gender());
			pstmt.setString(4, memVO.getMem_last_name());
			pstmt.setString(5, memVO.getMem_first_name());
			pstmt.setString(6, memVO.getMem_nickname());
			pstmt.setString(7, memVO.getMem_tel_no());
			pstmt.setString(8, memVO.getMem_cel_no());
			pstmt.setString(9, memVO.getMem_email());
			pstmt.setString(10, memVO.getMem_id());
			pstmt.setDate(11, memVO.getMem_birth());
			pstmt.setString(12, memVO.getMem_addr());
			pstmt.setInt(13, memVO.getMem_permission());
			pstmt.setInt(14, memVO.getStatus());
			pstmt.setTimestamp(15, memVO.getMem_build_time());
			pstmt.setInt(16, memVO.getMem_cert_status());
			pstmt.setInt(17, memVO.getMem_no());
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer mem_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, mem_no);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public Mem_VO findByPrimaryKey(Integer mem_no) {

		Mem_VO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, mem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				memVO = new Mem_VO();
				memVO.setMem_no(rs.getInt("mem_no"));
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_password(rs.getString("mem_password"));
				memVO.setMem_gender(rs.getInt("mem_gender"));
				memVO.setMem_last_name(rs.getString("mem_last_name"));
				memVO.setMem_first_name(rs.getString("mem_first_name"));
				memVO.setMem_nickname(rs.getString("mem_nickname"));
				memVO.setMem_tel_no(rs.getString("mem_tel_no"));
				memVO.setMem_cel_no(rs.getString("mem_cel_no"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_id(rs.getString("mem_id"));
				memVO.setMem_birth(rs.getDate("mem_birth"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_permission(rs.getInt("mem_permission"));
				memVO.setStatus(rs.getInt("status"));
				memVO.setMem_build_time(rs.getTimestamp("mem_build_time"));
				memVO.setMem_cert_status(rs.getInt("mem_cert_status"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memVO;
	}

	@Override
	public List<Mem_VO> getAll() {
		List<Mem_VO> list = new ArrayList<Mem_VO>();
		Mem_VO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]�٬� Domain objects
				memVO = new Mem_VO();
				memVO.setMem_no(rs.getInt("mem_no"));
				memVO.setMem_account(rs.getString("mem_account"));
				memVO.setMem_password(rs.getString("mem_password"));
				memVO.setMem_gender(rs.getInt("mem_gender"));
				memVO.setMem_last_name(rs.getString("mem_last_name"));
				memVO.setMem_first_name(rs.getString("mem_first_name"));
				memVO.setMem_nickname(rs.getString("mem_nickname"));
				memVO.setMem_tel_no(rs.getString("mem_tel_no"));
				memVO.setMem_cel_no(rs.getString("mem_cel_no"));
				memVO.setMem_email(rs.getString("mem_email"));
				memVO.setMem_id(rs.getString("mem_id"));
				memVO.setMem_birth(rs.getDate("mem_birth"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setMem_permission(rs.getInt("mem_permission"));
				memVO.setStatus(rs.getInt("status"));
				memVO.setMem_build_time(rs.getTimestamp("mem_build_time"));
				memVO.setMem_cert_status(rs.getInt("mem_cert_status"));
				list.add(memVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {

		Mem_JDBCDAO dao = new Mem_JDBCDAO();

//		// �s�W
//		Mem_VO memVO1 = new Mem_VO();
//		memVO1.setMem_account("qwe123");
//		memVO1.setMem_password("asd321");
//		memVO1.setMem_gender(1);
//		memVO1.setMem_last_name("��");
//		memVO1.setMem_first_name("�f�t");
//		memVO1.setMem_nickname("����");
//		memVO1.setMem_tel_no("02-12345678");
//		memVO1.setMem_cel_no("0912345678");
//		memVO1.setMem_email("puvonote@altmails.com");
//		memVO1.setMem_id("Z263574483");	
//		memVO1.setMem_birth(java.sql.Date.valueOf("1992-01-11"));
//		memVO1.setMem_addr("�s�_���s���Ϸs�׵�217��");
//		memVO1.setMem_permission(0);
//		memVO1.setStatus(0);
//		memVO1.setMem_build_time(java.sql.Timestamp.valueOf("2022-08-18 15:53:13"));
//		memVO1.setMem_cert_status(1);
//		dao.insert(memVO1);

		// �ק�
		Mem_VO memVO2 = new Mem_VO();

		memVO2.setMem_account("qwe123");
		memVO2.setMem_password("asd321");
		memVO2.setMem_gender(1);
		memVO2.setMem_last_name("��");
		memVO2.setMem_first_name("�f�t");
		memVO2.setMem_nickname("����");
		memVO2.setMem_tel_no("02-12345678");
		memVO2.setMem_cel_no("0912345678");
		memVO2.setMem_email("puvonote@altmails.com");
		memVO2.setMem_id("Z263574483");	
		memVO2.setMem_birth(java.sql.Date.valueOf("1992-01-11"));
		memVO2.setMem_addr("�s�_���s���Ϸs�׵�217��");
		memVO2.setMem_permission(0);
		memVO2.setStatus(0);
		memVO2.setMem_build_time(java.sql.Timestamp.valueOf("2022-08-18 15:53:13"));
		memVO2.setMem_cert_status(1);
		memVO2.setMem_no(1);
		dao.update(memVO2);
		System.out.println("update success!");

//		// �R��
//		dao.delete(1);

		// �d��
		Mem_VO memVO3 = dao.findByPrimaryKey(2);
		System.out.print(memVO3.getMem_no() + ",");
		System.out.print(memVO3.getMem_account() + ",");
		System.out.print(memVO3.getMem_password() + ",");
		System.out.print(memVO3.getMem_gender() + ",");
		System.out.print(memVO3.getMem_last_name() + ",");
		System.out.print(memVO3.getMem_first_name() + ",");
		System.out.println(memVO3.getMem_nickname());
		System.out.print(memVO3.getMem_tel_no() + ",");
		System.out.print(memVO3.getMem_cel_no() + ",");
		System.out.print(memVO3.getMem_email() + ",");
		System.out.print(memVO3.getMem_id() + ",");
		System.out.print(memVO3.getMem_birth() + ",");
		System.out.print(memVO3.getMem_addr() + ",");
		System.out.println(memVO3.getMem_permission());
		System.out.print(memVO3.getStatus() + ",");
		System.out.print(memVO3.getMem_build_time() + ",");
		System.out.println(memVO3.getMem_cert_status());
		System.out.println("---------------------");

		// �d��
		List<Mem_VO> list = dao.getAll();
		for (Mem_VO aEmp : list) {
			System.out.print(aEmp.getMem_no() + ",");
			System.out.print(aEmp.getMem_account() + ",");
			System.out.print(aEmp.getMem_password() + ",");
			System.out.print(aEmp.getMem_gender() + ",");
			System.out.print(aEmp.getMem_last_name() + ",");
			System.out.print(aEmp.getMem_first_name() + ",");
			System.out.println(aEmp.getMem_nickname());
			System.out.print(aEmp.getMem_tel_no() + ",");
			System.out.print(aEmp.getMem_cel_no() + ",");
			System.out.print(aEmp.getMem_email() + ",");
			System.out.print(aEmp.getMem_id() + ",");
			System.out.print(aEmp.getMem_birth() + ",");
			System.out.print(aEmp.getMem_addr() + ",");
			System.out.println(aEmp.getMem_permission());
			System.out.print(aEmp.getStatus() + ",");
			System.out.print(aEmp.getMem_build_time() + ",");
			System.out.println(aEmp.getMem_cert_status());
			System.out.println();
		}
	}
}