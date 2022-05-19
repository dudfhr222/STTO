package Bean;

//회원 정보
public class MemberBean {
    private String mem_name; //회원 이름

    private int mem_num; //회원 번호
    private String mem_id; //회원 아이디
 
    private String mem_pw; //회원 비밀번호
    private String mem_jumin; //회원 주민번호
    private String mem_tel; //회원 전화번호

    private String mem_email; //회원 이메일
    private String mem_interests; //회원 관심분야
    private String mem_introduce; //회원 자기소개

    private int mem_report; //회원 신고 누적 횟수

    public int getMem_num() {
        return mem_num;
    }
    public void setMem_num(int mem_num) {
        this.mem_num = mem_num;
    }
    public String getMem_id() {
        return mem_id;
    }
    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }
    public String getMem_pw() {
        return mem_pw;
    }
    public void setMem_pw(String mem_pw) {
        this.mem_pw = mem_pw;
    }
    public String getMem_name() {
        return mem_name;
    }
    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }
    public String getMem_jumin() {
        return mem_jumin;
    }
    public void setMem_jumin(String mem_jumin) {
        this.mem_jumin = mem_jumin;
    }
    public String getMem_tel() {
        return mem_tel;
    }
    public void setMem_tel(String mem_tel) {
        this.mem_tel = mem_tel;
    }
    public String getMem_email() {
        return mem_email;
    }
    public void setMem_email(String mem_email) {
        this.mem_email = mem_email;
    }
    public String getMem_interests() {
        return mem_interests;
    }
    public void setMem_interests(String mem_interests) {
        this.mem_interests = mem_interests;
    }
    public String getMem_introduce() {
        return mem_introduce;
    }
    public void setMem_introduce(String mem_introduce) {
        this.mem_introduce = mem_introduce;
    }
    public int getMem_report() {
        return mem_report;
    }
    public void setMem_report(int mem_report) {
        this.mem_report = mem_report;
    }
}
