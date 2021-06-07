package com.starbucks.dao;

import com.starbucks.vo.eventVO;

public class eventDAO extends DBConn {
	
	/** �̺�Ʈ ���̵� �޾Ƽ� �� ���� �������� **/
	public eventVO getContentResult(String eid) {
		eventVO vo = new eventVO();
		
		String sql = "SELECT TITLE, TO_CHAR(START_DATE,'YYYY-MM-DD'), TO_CHAR(LAST_DATE,'YYYY-MM-DD') FROM SB_EVENT WHERE EID=?";
		getPreparedStatement(sql);
		
		try {
		
			pstmt.setString(1, eid);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo.setTitle(rs.getString(1));
				vo.setStart_date(rs.getString(2));
				vo.setLast_date(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return vo;
	}
	
	public void close() {
		try {
			//6�ܰ� - ��������
	    	if(rs != null) rs.close();
	    	if (pstmt != null) pstmt.close();
	    	if (conn != null) conn.close();
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
