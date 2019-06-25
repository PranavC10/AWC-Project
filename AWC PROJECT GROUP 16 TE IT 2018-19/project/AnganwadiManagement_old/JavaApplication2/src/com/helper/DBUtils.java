package com.helper;

import com.database.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;



public class DBUtils  {
	public static List getBeanList(Class cls, String query) {
		Connection conn = null;
		List beans = null;
		try {
			conn = ConnectionManager.getDBConnection();
			QueryRunner qRunner = new QueryRunner();
			beans = (List) qRunner.query(conn, query, new BeanListHandler(cls));
			System.out.println("Executing " + query);
		} catch (SQLException e) {
			// handle the exception
			
		} finally {
			ConnectionManager.closeConnection(conn);
		}
		return beans;
	}

	public static List getBeanList(Class cls, String query, Object... param) {
		Connection conn = null;
		List beans = null;
		try {
			conn = ConnectionManager.getDBConnection();

			QueryRunner qRunner = new QueryRunner();
			beans = (List) qRunner.query(conn, query, new BeanListHandler(cls),
					param);
			System.out.println("Executing " + query);
		} catch (SQLException e) {
			// handle the exception
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn);
		}
		return beans;
	}

	public static List getMapList(String query) {
		Connection conn = null;
		List beans = null;
		try {
			conn = ConnectionManager.getDBConnection();

			QueryRunner qRunner = new QueryRunner();
			beans = (List) qRunner.query(conn, query, new MapListHandler());
			System.out.println("Executing " + query);
		} catch (SQLException e) {
			// handle the exception
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn);
		}
		return beans;
	}

	public static List getMapList(String query, Object... param) {
		Connection conn = null;
		List beans = null;
		try {
			conn = ConnectionManager.getDBConnection();

			QueryRunner qRunner = new QueryRunner();
			beans = (List) qRunner.query(conn, query, new MapListHandler(),
					param);
			System.out.println("Executing " + query);
		} catch (SQLException e) {
			// handle the exception
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn);
		}
		return beans;
	}

	public static List getParameterizedList(String query, Object... param) {
		Connection conn = null;
		List beans = null;
		try {
			conn = ConnectionManager.getDBConnection();

			QueryRunner qRunner = new QueryRunner();
			beans = (List) qRunner.query(conn, query, new MapListHandler(),
					param);
			System.out.println("Executing " + query);
		} catch (SQLException e) {
			// handle the exception
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(conn);
		}
		return beans;
	}

	public static int executeUpdate(String query, Object... param) {
		Connection conn = null;
		int beans = 0;
		try {
			conn = ConnectionManager.getDBConnection();
			QueryRunner qRunner = new QueryRunner();
			if (param != null)
				beans = qRunner.update(conn, query, param);
			else
				beans = qRunner.update(conn, query);
			System.out.println("Executing " + query);
		} catch (SQLException e) {

			System.err.println(e.getMessage()+" Query - "+query);
		} finally {
			ConnectionManager.closeConnection(conn);
		}
		return beans;
	}

	public static boolean dataExists(String query) {

		boolean success = false;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getDBConnection();
			rs = conn.createStatement().executeQuery(query);
			System.out.println("Executing " + query);
			if (rs.next()) {
				success = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public static String getMaxValueStr(String query) {

		String success = "";
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getDBConnection();
			rs = conn.createStatement().executeQuery(query);
			if (rs.next()) {
				success = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public static int getMaxValue(String query) {

		int success = -1;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getDBConnection();
			rs = conn.createStatement().executeQuery(query);
			if (rs.next()) {
				success = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public static void main(String[] args) {
		getMap("select stopId, latitude, longitude from stops");
	}

	public static HashMap getMap(String query) {
		
		int success = -1;
		String stp = null;
		
		Connection conn = null;
		ResultSet rs = null;
		HashMap map = new HashMap();
		try {
			conn = ConnectionManager.getDBConnection();
			rs = conn.createStatement().executeQuery(query);
			while (rs.next()) {
				double[] lt = new double[2];
				success = rs.getInt(1);
				lt[0] = rs.getDouble(2);
				lt[1] = rs.getDouble(3);
				String lat ="";
				lat = lt[0]+","+lt[1];
				map.put(success, lt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	public static HashMap getDBMap(String query) {
		HashMap map = new HashMap();
		int success = -1;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getDBConnection();
			rs = conn.createStatement().executeQuery(query);
			while (rs.next()) {
				map.put(rs.getString(1), rs.getString(2));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
}
