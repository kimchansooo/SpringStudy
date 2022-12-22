package kr.or.kosa;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ItemDao;
import service.ItemService;
import vo.Emp;
import vo.Item;

@Controller
@RequestMapping("/customer/")
public class ItemsController extends HttpServlet {

	private ItemService itemservice;

	@Autowired
	public void setItemservice(ItemService itemservice) {
		this.itemservice = itemservice;
	}

	@GetMapping("items.htm")
	public String items(Model model) {
		List<Emp> emptList = itemservice.items();
		model.addAttribute("emptList", emptList);
		return "customer/items";
	}

	@GetMapping("addForm.htm")
	public String addForm() {
		return "customer/addForm";
	}

	@PostMapping(value = "addForm.htm")
	public String addForm(Emp emp) {
		String url = null;
		try {
			url = itemservice.empInsert(emp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return url;
	}

	// 상세보기
	@GetMapping("detailForm.htm")
	public String detailForm(String empno, Model model) {
		Emp emp = itemservice.empDetail(empno);
		model.addAttribute("emp", emp);
		return "customer/detailForm";
	}

	@PostMapping(value="detailForm.htm") 
	public String editForm(Emp emp) { 
		String url = null;
		try {
			url = itemservice.empEdit(emp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
		
	@GetMapping("empDel.htm")
	public String empDel(String empno) {
		return itemservice.empDel(empno);
	}
}
