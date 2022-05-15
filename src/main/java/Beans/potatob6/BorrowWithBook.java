package Beans.potatob6;

import org.springframework.stereotype.Component;

@Component("PBBorrowWithBook")
public class BorrowWithBook {

    private int borrowId;
    private int bookId;
    private int userId;
    private String borrowDate;
    private int timeLimit;
    private String returnDate;
    private Book book;
    private User user;

    public int getBorrowId() {
        return borrowId;
    }

    public void setBorrowId(int borrowId) {
        this.borrowId = borrowId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(String borrowDate) {
        this.borrowDate = borrowDate;
    }

    public int getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(int timeLimit) {
        this.timeLimit = timeLimit;
    }

    public String getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "BorrowWithBook{" +
                "borrowId=" + borrowId +
                ", bookId=" + bookId +
                ", userId=" + userId +
                ", borrowDate='" + borrowDate + '\'' +
                ", timeLimit=" + timeLimit +
                ", returnDate='" + returnDate + '\'' +
                ", book=" + book +
                ", user=" + user +
                '}';
    }
}
