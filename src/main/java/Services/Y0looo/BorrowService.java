package Services.Y0looo;

import Beans.czt.Borrow;
import Beans.czt.BorrowWithBook;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BorrowService {

    public List<BorrowWithBook> getAllBorrowByUserId(int userId);

    public HashMap<String,String> borrowBook(int bookId, Integer userId);

    public List<BorrowWithBook> getBorrowUserIsReturn(int userId);

    public List<BorrowWithBook> getBorrowUserNotReturn(int userId);

    public List<BorrowWithBook> getBorrowWillOverTime(int userId);

    public Borrow getBorrowByBookId(int userId,int bookId);

    public HashMap<String,String> returnBook(int bookId, int userId, int borrowId);
}
