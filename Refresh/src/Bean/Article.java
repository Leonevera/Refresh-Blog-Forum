package Bean;

import java.util.Date;

public class Article {
	private int id;				//����id
	private String title;		//���±���
	private String content;		//��������
	private String author;		//��������
	private Date publictime;	//���·���ʱ��
	private String date;		//���ַ�����ʽ��ʾ���·���ʱ��
	private int views;			//�����
	private int likes;			//������
	private int publicity;		//�����ԣ�0,1��
	
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
