package DB;



import java.sql.*;
import java.util.ArrayList;

 

public class DBConn {
	public static Connection connection;

	public static boolean connect()

	{

		try {

			Class.forName("com.kingbase.Driver"); // ������������

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
	 * ִ�в�ѯ�����ص������ 
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
	 * ִ�в�ѯ�����ؽ��
	 * 
	 * String @sql: ָ����SQL���
	 * 
	 * ���� ArrayList<String[]>�� ����һ����ÿһ�����ַ�������String[],ÿ����Ԫ����һ���ַ���
	 * 
	 * ���У���������ַ������飩����һ����̬������ArrayList
	 */

	public static ArrayList<String[]> executeQuery(String sql) {

		if (!connect())

			return null;

		ArrayList<String[]> rlt = new ArrayList<String[]>();

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			// ִ�в�ѯ

			int NumAttributes = rs.getMetaData().getColumnCount();

			// �õ����Եĸ���

			while (rs.next()) {

				// ��ÿһ�У�����һ���ַ�������

				String[] oneRow = new String[NumAttributes];

				int i;

				for (i = 1; i <= NumAttributes; i++) {

					oneRow[i - 1] = rs.getString(i);

				}

				rlt.add(oneRow);

				// ����һ�мӵ������

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
	 * ִ�и���
	 * 
	 * �������ΪSQL��������Update,Delete��Insert
	 * 
	 * ���ɹ�ִ��(����������һ��Ԫ��)������true, ���򷵻�false
	 */

	public static boolean executeUpdate(String sql) {

		if (!connect())

			return false;

		int rlt = 0;

		try {

			Statement stmt = connection.createStatement();

			rlt = stmt.executeUpdate(sql);

			// rlt���ر����ĵ�Ԫ�����

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
		
		// �õ����ؽ��
		int i, j;
		for (i = 0; i < rlt.size(); i++) {
			String[] row = rlt.get(i);
			// ���һ��
			for (j = 0; j < row.length; j++) {
				System.out.print(row[j] + " | ");
			}
			System.out.println();
		}

	}

}
