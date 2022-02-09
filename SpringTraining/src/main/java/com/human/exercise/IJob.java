package com.human.exercise;

import java.util.ArrayList;

public interface IJob {
	ArrayList<Job> jobList();
	ArrayList<EmpInfo> getList(String jobid);
	ArrayList<EmpD> getDid();
	ArrayList<EmpF> getFname(String eid);
	ArrayList<hum> getHu();
	ArrayList<humm> getHuu(String eid);
}
