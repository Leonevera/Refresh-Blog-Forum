package Bean;

import java.util.Date;

public class Topic {
	private int id;						//����ID
	private String name;				//��������
	private String creator;				//���ⴴ����
	private String intro;				//������
	private Date createtime;			//����ʱ��
	private int focusnum;				//��ע����
	private int articlenum;				//������������
	private int views;					//���������
	
	public int getID(){
		return id;
	}
	public void setID(int id){
		this.id = id;
	}
	public String getTopicName() {
		return name;
	}
	public void setTopicName(String name) {
		this.name = name;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getTopicIntro() {
		return intro;
	}
	public void setTopicIntro(String intro) {
		this.intro = intro;
	}
	public Date getCreateTime() {
		return createtime;
	}
	public void setCreateTime(Date time) {
		this.createtime = time;
	}
	public int getFocusNum() {
		return focusnum;
	}
	public void setFocusNum(int fnum) {
		this.focusnum = fnum;
	}
	public int getArticleNum() {
		return articlenum;
	}
	public void setArticleNum(int anum) {
		this.articlenum = anum;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
}
