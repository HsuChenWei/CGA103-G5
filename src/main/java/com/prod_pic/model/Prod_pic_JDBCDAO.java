package com.prod_pic.model;

import static com.util.Common.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Prod_pic_JDBCDAO implements Prod_pic_DAO_interface{
	
	private static final String INSERT_STMT = 
		"INSERT INTO prod_pic (prod_no,prod_pic,prod_pic_name) VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT prod_pic_no,prod_no,prod_pic,prod_pic_name FROM prod_pic order by prod_pic_no";
	private static final String GET_ONE_STMT = 
		"SELECT prod_pic_no,prod_no,prod_pic,prod_pic_name FROM prod_pic where prod_pic_no = ?";
	private static final String DELETE = 
		"DELETE FROM prod_pic where prod_pic_no = ?";
	private static final String UPDATE = 
		"UPDATE prod_pic set prod_no=?, prod_pic=?, prod_pic_name=? where prod_pic_no = ?";

	@Override
	public void insert(Prod_pic_VO prod_picVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, prod_picVO.getProd_no());
			pstmt.setBytes(2, prod_picVO.getProd_pic());
			pstmt.setString(3, prod_picVO.getProd_pic_name());

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
	public void update(Prod_pic_VO prod_picVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, prod_picVO.getProd_no());
			pstmt.setBytes(2, prod_picVO.getProd_pic());
			pstmt.setString(3, prod_picVO.getProd_pic_name());
			pstmt.setInt(4, prod_picVO.getProd_pic_no());
			
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
	public void delete(Integer prod_pic_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, prod_pic_no);

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
	public Prod_pic_VO findByPrimaryKey(Integer prod_pic_no) {
		Prod_pic_VO prod_picVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, prod_pic_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				prod_picVO = new Prod_pic_VO();
				prod_picVO.setProd_pic_no(rs.getInt("prod_pic_no"));
				prod_picVO.setProd_no(rs.getInt("prod_no"));
				prod_picVO.setProd_pic(rs.getBytes("prod_pic"));
				prod_picVO.setProd_pic_name(rs.getString("prod_pic_name"));
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
		return prod_picVO;
	}			


	@Override
	public List<Prod_pic_VO> getAll() {
		List<Prod_pic_VO> list = new ArrayList<Prod_pic_VO>();
		Prod_pic_VO prod_picVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {

				prod_picVO = new Prod_pic_VO();
				prod_picVO.setProd_pic_no(rs.getInt("prod_pic_no"));
				prod_picVO.setProd_no(rs.getInt("prod_no"));
				prod_picVO.setProd_pic(rs.getBytes("prod_pic"));
				prod_picVO.setProd_pic_name(rs.getString("prod_pic_name"));
				
				list.add(prod_picVO); // Store the row in the list
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

		Prod_pic_JDBCDAO dao = new Prod_pic_JDBCDAO();

		// 新增
		Prod_pic_VO prod_picVO1 = new Prod_pic_VO();
		prod_picVO1.setProd_no(4);
		prod_picVO1.setProd_pic(null);
		prod_picVO1.setProd_pic_name(null);
		dao.insert(prod_picVO1);

		// 修改
		Prod_pic_VO prod_picVO2 = new Prod_pic_VO();
		prod_picVO2.setProd_pic_no(6);
		prod_picVO2.setProd_no(1005);
		prod_picVO2.setProd_pic(null);
		prod_picVO2.setProd_pic_name(null);
		dao.update(prod_picVO2);

		// 刪除
		dao.delete(15);
		

		// 查詢
		Prod_pic_VO prod_picVO3 = dao.findByPrimaryKey(1);
		System.out.print(prod_picVO3.getProd_pic_no() + ",");
		System.out.print(prod_picVO3.getProd_no() + ",");
		System.out.print(prod_picVO3.getProd_pic() + ",");
		System.out.print(prod_picVO3.getProd_pic_name() + ",");
		System.out.println();
		System.out.println("-----------------------------------------");

		// 查詢
		List<Prod_pic_VO> list = dao.getAll();
		for (Prod_pic_VO allProd_pic : list) {
			System.out.print(allProd_pic.getProd_pic_no() + ",");
			System.out.print(allProd_pic.getProd_no() + ",");
			System.out.print(allProd_pic.getProd_pic() + ",");
			System.out.print(allProd_pic.getProd_pic_name() + ",");
			System.out.println();
		}
	}
}
