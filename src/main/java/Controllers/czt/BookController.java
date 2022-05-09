package Controllers.czt;

import Beans.czt.Borrow;
import Beans.potatob6.Book;
import Beans.potatob6.User;
import Services.Y0looo.Impl.BookServiceImpl;
import Services.Y0looo.Impl.BorrowServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@Controller
public class BookController {

    @Autowired
    private BookServiceImpl bookService;

    @Autowired
    private BorrowServiceImpl borrowService;

    @RequestMapping("toBooks")
    public String allBooks(Model model){
        List list = bookService.getAllBooks();
        if(list != null) {
            model.addAttribute("books", list);
            return "Y0looo/ShowBooks";
        } else {
            model.addAttribute("errorMsg", "查询不到图书信息");
            return "Y0looo/sup";
        }
    }


    @RequestMapping("borrow")
    public String borrowBook(HttpServletRequest request, Model model, int bookId){
        User user = (User) request.getSession().getAttribute("user");
        HashMap<String, String> map = borrowService.borrowBook(bookId, user.getUserId());
        String message = map.get("message");
        model.addAttribute("sup", message);
        return "Y0looo/sup";

        //Book book = bookService.queryBookByBookId(bookId);
        //Borrow exist = borrowService.getBorrowByBookId(user.getUserId(), bookId);
        //if(book == null) {
        //    model.addAttribute("sup","查找不到此书");
        //    return "Y0looo/sup";
        //}
        //if(book.getStorageCount() == 0){
        //    model.addAttribute("sup","书籍无库存");
        //    return "Y0looo/sup";
        //}
        //if(exist != null){
        //    model.addAttribute("sup","你已经借过此书了");
        //    return "Y0looo/sup";
        //}
        //Borrow borrow = new Borrow();
        //borrow.setBookId(bookId);
        //borrow.setUserId(user.getUserId());
        //SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        //Date date = new Date();
        //borrow.setBorrowDate(format.format(date));
        //borrow.setTimeLimit(30);
        //boolean result = borrowService.borrowBook(borrow);
        //if(result){
        //    book.setStorageCount(book.getStorageCount()-1);
        //    bookService.updateBookStorageCount(book);
        //    model.addAttribute("sup","借阅成功");
        //    return "Y0looo/sup";
        //} else {
        //    model.addAttribute("sup","借阅失败");
        //    return "Y0looo/sup";
        //}
    }

    @RequestMapping("return")
    public String returnBook(HttpServletRequest request, Model model, int bookId, int borrowId) {
        User user = (User) request.getSession().getAttribute("user");
        HashMap<String, String> map = borrowService.returnBook(bookId, user.getUserId(), borrowId);
        String message = map.get("message");
        model.addAttribute("sup1", message);
        return "Y0looo/sup";
        //Borrow borrow = borrowService.getBorrowByBookId(user.getUserId(), bookId);
        //if(borrow == null ) {
        //    model.addAttribute("sup1","查找不到此条借阅信息");
        //    return "Y0looo/sup";
        //}
        //if(borrow.getUserId() !=user.getUserId() ) {
        //    model.addAttribute("sup1", "权限错误，非当前用户所借的书，无法归还");
        //    return "Y0looo/sup";
        //}
        //Book book = bookService.queryBookByBookId(bookId);
        //if(book == null){
        //    model.addAttribute("sup1","查找不到此书");
        //    return "Y0looo/sup";
        //}
        //book.setStorageCount(book.getStorageCount()+1);
        //boolean result1 = bookService.updateBookStorageCount(book);
        //borrow.setBookId(bookId);
        //borrow.setBorrowId(borrowId);
        //borrow.setUserId(user.getUserId());
        //SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        //Date date = new Date();
        //borrow.setReturnDate(format.format(date));
        //boolean result2 = borrowService.returnBook(borrow);
        //if(result1 && result2){
        //    model.addAttribute("sup1", "归还成功");
        //    return "Y0looo/sup";
        //} else {
        //    model.addAttribute("sup1", "归还失败");
        //    return "Y0looo/sup";
        //}
    }

    @RequestMapping("queryBookByBookName")
    public String queryBookByBookName(Model model, String bookName) {
        List list = bookService.getBooksByBookName(bookName);
        if(list != null){
            model.addAttribute("books", list);
            return "Y0looo/ShowBooks";
        } else {
            model.addAttribute("errorMsg", "查询不到图书信息");
            return "Y0looo/sup";
        }

    }

    @RequestMapping("queryBookByAuthor")
    public String queryBookByAuthor(Model model, String author) {
        List list = bookService.queryBookByAuthor(author);
        if(list != null){
            model.addAttribute("books", list);
            return "Y0looo/ShowBooks";
        } else {
            model.addAttribute("errorMsg", "查询不到图书信息");
            return "Y0looo/sup";
        }
    }
}
