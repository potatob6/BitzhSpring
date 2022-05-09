package Services.Y0looo.Impl;

import Beans.czt.Borrow;
import Beans.czt.BorrowWithBook;
import Beans.potatob6.Book;
import Mappers.czt.Book1Mapper;
import Mappers.czt.BorrowMapper;
import Services.Y0looo.BookService;
import Services.Y0looo.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BorrowServiceImpl implements BorrowService {
    @Autowired
    private BorrowMapper borrowDao;

    @Autowired
    private Book1Mapper bookDao;

    /**
     * 通过用户id获取所有借阅信息
     * @param userId
     * @return
     */
    @Override
    public List<BorrowWithBook> getAllBorrowByUserId (int userId) {
        return borrowDao.getAllBorrowByUserId(userId);
    }

    /**
     * 借阅书籍
     * @return
     */
    @Override
    public HashMap<String,String> borrowBook (int bookId, Integer userId) {
        HashMap<String, String> map = new HashMap<>();
        Book book = bookDao.queryBookByBookId(bookId);
        Borrow exist = borrowDao.getBorrowByBookId(userId, bookId);
        if(book == null) {
            map.put("message","查找不到此书");
            return map;
        }
        if(book.getStorageCount() == 0) {
            map.put("message","此书库存不足");
            return map;
        }
        if(exist != null) {
            map.put("message","你已经借过此书了");
            return map;
        }
        Borrow borrow = new Borrow();
        borrow.setBookId(bookId);
        borrow.setUserId(userId);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        borrow.setBorrowDate(format.format(date));
        borrow.setTimeLimit(30);
        boolean result = borrowDao.borrowBook(borrow);
        if(result) {
            book.setStorageCount(book.getStorageCount()-1);
            bookDao.updateBookStorageCount(book);
            map.put("message","借阅成功");
        } else {
            map.put("message","借阅失败");
        }
        return map;
    }

    /**
     * 获取用户已归还的借阅信息
     * @param userId
     * @return
     */
    @Override
    public List<BorrowWithBook> getBorrowUserIsReturn (int userId) {
        return borrowDao.getBorrowUserIsReturn(userId);
    }

    /**
     * 获取用户未归还的借阅信息
     * @param userId
     * @return
     */
    @Override
    public List<BorrowWithBook> getBorrowUserNotReturn (int userId) {
        return borrowDao.getBorrowUserNotReturn(userId);
    }

    /**
     * 获取用户即将到期的借阅信息，按归还期限升序
     * @param userId
     * @return
     */
    @Override
    public List<BorrowWithBook> getBorrowWillOverTime (int userId) {
        return borrowDao.getBorrowWillOverTime(userId);
    }

    /**
     * 获取用户某本图书的借阅记录
     * @param userId
     * @param bookId
     * @return
     */
    @Override
    public Borrow getBorrowByBookId (int userId, int bookId) {
        return borrowDao.getBorrowByBookId(userId, bookId);
    }

    /**
     * 归还图书
     * @param
     * @return
     */
    @Override
    public HashMap<String, String> returnBook (int bookId, int userId, int borrowId) {
        HashMap<String, String> map = new HashMap<>();
        Borrow borrow = borrowDao.getBorrowByBookId(userId, bookId);
        if(borrow == null) {
            map.put("message", "查找不到此条借阅信息");
            return map;
        }
        Book book = bookDao.queryBookByBookId(bookId);
        if(book == null) {
            map.put("message", "查找不到此书");
            return map;
        }
        borrow.setBookId(bookId);
        borrow.setBorrowId(borrowId);
        borrow.setUserId(userId);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        borrow.setReturnDate(format.format(date));
        boolean result = borrowDao.returnBook(borrow);
        if(result) {
            book.setStorageCount(book.getStorageCount()+1);
            if(bookDao.updateBookStorageCount(book)){
                map.put("message", "归还成功");
            }
        } else {
            map.put("message", "归还失败");
        }
        return map;
    }
}
