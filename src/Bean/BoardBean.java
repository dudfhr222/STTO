package Bean;

public class BoardBean {
    private int b_number; //작성글 번호
    private String b_id; //작성자 아이디
    private String b_title; //작성글 제목
    private String b_content; //글 내용
    private int b_dday; //남은 날짜
    private String b_startdate; //시작 날짜
    private String b_finishdate; //종료 날짜
    private int stmembers_mem_num;
    private int b_stmember; //
    private String b_inter_c; //
    private String interests; //관심 분야
    private String languages; //관심 언어
    private String area; //관심 지역
    private String b_goal; //목표
    private int b_status; //현재 인원
    private int b_group; //
    private int b_gmember = 0;


    public int getB_number() {
        return b_number;
    }
    public String getArea() {
        return area;
    }
    public void setB_number(int b_number) {
        this.b_number = b_number;
    }

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public String getB_title() {
        return b_title;
    }

    public void setB_title(String b_title) {
        this.b_title = b_title;
    }

    public String getB_content() {
        return b_content;
    }

    public void setB_content(String b_content) {
        this.b_content = b_content;
    }

    public int getB_dday() {
        return b_dday;
    }

    public void setB_dday(int b_dday) {
        this.b_dday = b_dday;
    }

    public String getB_startdate() {
        return b_startdate;
    }

    public void setB_startdate(String b_startdate) {
        this.b_startdate = b_startdate;
    }

    public String getB_finishdate() {
        return b_finishdate;
    }

    public void setB_finishdate(String b_finishdate) {
        this.b_finishdate = b_finishdate;
    }

    public int getStmembers_mem_num() {
        return stmembers_mem_num;
    }

    public void setStmembers_mem_num(int stmembers_mem_num) {
        this.stmembers_mem_num = stmembers_mem_num;
    }

    public int getB_stmember() {
        return b_stmember;
    }

    public void setB_stmember(int b_stmember) {
        this.b_stmember = b_stmember;
    }

    public String getB_inter_c() {
        return b_inter_c;
    }

    public void setB_inter_c(String b_inter_c) {
        this.b_inter_c = b_inter_c;
    }

    public String getInterests() {
        return interests;
    }

    public void setInterests(String interests) {
        this.interests = interests;
    }

    public String getLanguages() {
        return languages;
    }

    public void setLanguages(String languages) {
        this.languages = languages;
    }



    public void setArea(String area) {
        this.area = area;
    }

    public String getB_goal() {
        return b_goal;
    }

    public void setB_goal(String b_goal) {
        this.b_goal = b_goal;
    }

    public int getB_status() {
        return b_status;
    }

    public void setB_status(int b_status) {
        this.b_status = b_status;
    }

    public int getB_group() {
        return b_group;
    }

    public void setB_group(int b_group) {
        this.b_group = b_group;
    }

    public int getB_gmember() {
        return b_gmember;
    }

    public void setB_gmember(int b_gmember) {
        this.b_gmember = b_gmember;
    }
}
