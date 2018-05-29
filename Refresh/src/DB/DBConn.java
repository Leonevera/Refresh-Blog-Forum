package DB;



import java.sql.*;
import java.util.ArrayList;

 

public class DBConn {
	public static Connection connection;

	public static boolean connect()

	{

		try {

			Class.forName("com.kingbase.Driver"); // 加载驱动程序

			String url = "jdbc:kingbase://localhost/SAMPLES";

			connection = DriverManager.getConnection(url, "SYSTEM", "root");

		}

		catch (Exception e) {

			e.printStackTrace();

			return false;

		}

		return true;

	}

	public static void close()

	{

		try

		{

			connection.close();

		}

		catch (Exception e)

		{

			e.printStackTrace();

		}
		;

	}
	
	/* 
	 * 执行查询，返回单个结果 
	 **/
	public static String getSingleValue(String sql){
		ArrayList<String[]> listRlt = executeQuery(sql); 
		if (listRlt!=null){
			if(listRlt.size()>0){
				
				return listRlt.get(0)[0];
			
			}
			else{
				
				
				return null;
			}
			}
		else{
			
			return null;
		}
			
	}

	/*
	 * 
	 * 执行查询，返回结果
	 * 
	 * String @sql: 指定的SQL语句
	 * 
	 * 返回 ArrayList<String[]>， 返回一个表，每一行是字符串数组String[],每个单元格是一个字符串
	 * 
	 * 多行（即：多个字符串数组）构成一个动态增长的ArrayList
	 */

	public static ArrayList<String[]> executeQuery(String sql) {

		if (!connect())

			return null;

		ArrayList<String[]> rlt = new ArrayList<String[]>();

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			// 执行查询

			int NumAttributes = rs.getMetaData().getColumnCount();

			// 得到属性的个数

			while (rs.next()) {

				// 对每一行，生成一个字符串数组

				String[] oneRow = new String[NumAttributes];

				int i;

				for (i = 1; i <= NumAttributes; i++) {

					oneRow[i - 1] = rs.getString(i);

				}

				rlt.add(oneRow);

				// 将这一行加到结果集

			}

		}

		catch (Exception ex) {

			ex.printStackTrace(System.out);

		}

		close();

		return rlt;

	}

	/*
	 * 
	 * 执行更新
	 * 
	 * 输入参数为SQL，必须是Update,Delete或Insert
	 * 
	 * 若成功执行(更改了至少一个元组)，返回true, 否则返回false
	 */

	public static boolean executeUpdate(String sql) {

		if (!connect())

			return false;

		int rlt = 0;

		try {

			Statement stmt = connection.createStatement();

			rlt = stmt.executeUpdate(sql);

			// rlt记载被更改的元组个数

		}

		catch (Exception ex) {

			ex.printStackTrace(System.out);

		}

		close();

		if (rlt > 0)

			return true;

		else

			return false;

	}

	public static void main(String[] args) {

		String sql = "SELECT * FROM \"S-C\".SC";
		ArrayList<String[]> rlt = executeQuery(sql);
		
		// 得到返回结果
		int i, j;
		for (i = 0; i < rlt.size(); i++) {
			String[] row = rlt.get(i);
			// 输出一行
			for (j = 0; j < row.length; j++) {
				System.out.print(row[j] + " | ");
			}
			System.out.println();
		}

	}

}
