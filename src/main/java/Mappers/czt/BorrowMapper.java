package Mappers.czt;

import Beans.czt.Borrow;
import Beans.czt.BorrowWithBook;
import Beans.potatob6.Book;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface BorrowMapper {

    /**
     * 查询当前用户所有借阅信息
     * @param userId
     * @return
     */
    @Select("select * from borrow,Books where userId=#{userId} and borrow.bookId=Books.bookId order by borrowId asc")
    public List<BorrowWithBook> getAllBorrowByUserId(int userId);

    /**
     * 用户借书
     * @param borrow
     * @return
     */
    @Insert("insert into borrow ( bookId, userId, borrowDate, timeLimit, returnDate) values( #{bookId}, #{userId}, #{borrowDate}, #{timeLimit}, #{returnDate})")
    public Boolean borrowBook(Borrow borrow);

    /**
     * 查询用户所有已经归还的借阅信息
     * @param userId
     * @return
     */
    @Select("select * from borrow,Books where userId=#{userId} and returnDate is not null and borrow.bookId=Books.bookId order by borrowId asc")
    public List<BorrowWithBook> getBorrowUserIsReturn(int userId);

    /**
     * 查询用户所有未归还的借阅信息
     * @param userId
     * @return
     */
    @Select("select * from borrow,Books where userId=#{userId} and returnDate is null and borrow.bookId=Books.bookId")
    public List<BorrowWithBook> getBorrowUserNotReturn(int userId);

    /**
     * 查询用户即将到期的借阅信息
     * @param userId
     * @return
     */
    @Select("select * from borrow,Books where userId=#{userId} and borrow.bookId=Books.bookId and returnDate is null order by timeLimit asc")
    public List<BorrowWithBook> getBorrowWillOverTime(int userId);

    /**
     * 查询借阅记录是否已归还
     * @param userId
     * @param bookId
     * @return
     */
    @Select("select * from borrow where userId=#{userId} and bookId=#{bookId} and returnDate is null" )
    public Borrow getBorrowByBookId(@Param("userId") int userId, @Param("bookId") int bookId);

    /**
     * 归还图书
     * @param borrow
     * @return
     */
    @Update("update borrow set returnDate=#{returnDate}, timeLimit=0 where borrowId=#{borrowId} and userId=#{userId} and bookId=#{bookId}")
    public boolean returnBook(Borrow borrow);
}
