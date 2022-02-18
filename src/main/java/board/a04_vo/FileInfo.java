package board.a04_vo;

import java.util.Date;

public class FileInfo {
	private int fno;
	private String pathinfo;
	private String fname;
	private Date regdte;
	private Date uptdte;
	private String etc;
	public FileInfo(String pathinfo, String fname, String etc) {
		super();
		this.pathinfo = pathinfo;
		this.fname = fname;
		this.etc = etc;
	}
	public FileInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getPathinfo() {
		return pathinfo;
	}
	public void setPathinfo(String pathinfo) {
		this.pathinfo = pathinfo;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
}
