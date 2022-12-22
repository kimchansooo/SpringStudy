package dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vo.Item;



@Repository
public class ItemDao implements ItemInterface{
	private JdbcTemplate jdbctemplate;
	
	@Autowired
	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}
	
	@Override
	public List<Item> getItems(Long id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Item item) throws ClassNotFoundException, SQLException {
		System.out.println("1");
		String sql = "INSERT INTO ITEM(ID,ITEMNAME,PRICE,QUANTITY) VALUES((SELECT MAX(TO_NUMBER(ID))+1 FROM ITEM),?,?,?)";
		return this.jdbctemplate.update(sql, item.getItemName(), item.getPrice(), item.getQuantity());
	}

	
}
