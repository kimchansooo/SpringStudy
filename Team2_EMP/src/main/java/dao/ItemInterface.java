package dao;

import java.sql.SQLException;
import java.util.List;

import vo.Item;

public interface ItemInterface {
	//전체 상품수
	List<Item> getItems(Long id) throws ClassNotFoundException, SQLException;
	int insert(Item item) throws ClassNotFoundException, SQLException;
}
