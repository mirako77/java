package ghh.citelum.utils;

import java.io.Serializable;

public class Request implements Serializable {
    private static final long serialVersionUID = 1513207428686438208L;
    private int left;
    private int right;
    public int getLeft() {return left;}
    public void setLeft(int left) {this.left = left;}
    public int getRight() {return right;}
    public void setRight(int right) {this.right = right;}
    
}