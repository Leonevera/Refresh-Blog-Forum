package Bean;

import java.util.Date;

public class Article {
	private int id;				//文章id
	private String title;		//文章标题
	private String content;		//文章内容
	private String author;		//文章作者
	private Date publictime;	//文章发布时间
	private String date;		//以字符串格式表示文章发表时间
	private int views;			//浏览量
	private int likes;			//点赞数
	private int publicity;		//公开性（0,1）
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPublicTime() {
		return publictime;
	}
	public void setPublicTime(Date time) {
		this.publictime = time;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getPublicity() {
		return publicity;
	}
	public void setPublicity(int p) {
		this.publicity = p;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
