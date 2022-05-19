package Bean;
//GroupRequestBean

//가입 신청 인원 및 작성자 정보
public class GroupRegisterBean {
    private String mem_name; //신청자 이름
    private String mem_id; //신청자 아이디
    private String b_title; //신청 글 제목

    private String b_id; //글 작성자 아이디
    private int b_gmember; //개인 번호
    private int b_group; //작성글 번호

    public String getMem_name() {
        return mem_name;
    }
    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }
    public String getMem_id() {
        return mem_id;
    }
    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }
    public String getB_title() {
        return b_title;
    }
    public void setB_title(String b_title) {
        this.b_title = b_title;
    }
    public String getB_id() {
        return b_id;
    }
    public void setB_id(String b_id) {
        this.b_id = b_id;
    }
    public int getB_gmember() {
        return b_gmember;
    }
    public void setB_gmember(int b_gmember) {
        this.b_gmember = b_gmember;
    }
    public int getB_group() {
        return b_group;
    }
    public void setB_group(int b_group) {
        this.b_group = b_group;
    }
}
